%% Motor Parameters
%% Xiaowu 2011/07/08
%% From Oak Ridge National Laboratory
%% 2010 Prius
%%
%% Generator and motor share the same efficiency map
%% but generator torque is only 70% of motor torque

%% ================================================================== %%
%% Motor
m_inertia=0.0226; % (kg*m^2), rotor's rotational inertia

m_map_trq=0:10:200; % (N*m)
m_map_spd=(0:500:12000)*(2*pi)/60; % (rad/s)
m_eff_map=[...
0.2	    0.2	    0.2	    0.2  	0.2	    0.2	    0.2	    0.2   	0.2  	0.2 	0.2 	0.2 	0.2 	0.2 	0.2 	0.2 	0.2 	0.2 	0.2 	0.2 	0.2;
0.4	    0.6	    0.68	0.71	0.72	0.72	0.72	0.71	0.7	    0.695	0.68	0.66	0.65	0.635	0.61	0.6	    0.6	    0.6	    0.58	0.54	0.46;
0.5	    0.72	0.785	0.815	0.822	0.825	0.827	0.827	0.825	0.82	0.804	0.8	    0.786	0.78	0.765	0.75	0.742	0.72	0.7	    0.66	0.65;
0.53	0.768	0.82	0.848	0.858	0.864	0.865	0.863	0.854	0.855	0.85	0.843	0.84	0.827	0.821	0.809	0.798	0.78	0.769	0.74	0.735;
0.62	0.8  	0.859	0.872	0.882	0.886	0.888	0.887	0.881	0.883	0.882	0.878	0.877	0.867	0.869	0.85	0.84	0.82	0.811	0.794	0.794;
0.64	0.81	0.861	0.883	0.896	0.904	0.906	0.907	0.902	0.904	0.901	0.897	0.894	0.888	0.883	0.876	0.868	0.856	0.85	0.846	0.846;
0.70    0.822	0.872	0.897	0.908	0.915	0.918	0.921	0.923	0.92	0.917	0.914	0.908	0.907	0.901	0.897	0.892	0.886	0.886	0.886	0.886;
0.72	0.84	0.88	0.905	0.916	0.924	0.927	0.93	0.931	0.931	0.93	0.927	0.921	0.917	0.912	0.913	0.913	0.913	0.913	0.913	0.913;
0.75	0.842	0.886	0.912	0.925	0.932	0.936	0.938	0.94	0.94	0.94	0.935	0.932	0.926	0.922	0.922	0.922	0.922	0.922	0.922	0.922;
0.68	0.859	0.9	    0.921	0.936	0.943	0.946	0.948	0.947	0.946	0.944	0.941	0.938	0.938	0.938	0.938	0.938	0.938	0.938	0.938	0.938;
0.58	0.852	0.909	0.931	0.947	0.95	0.951	0.952	0.951	0.948	0.946	0.946	0.946	0.946	0.946	0.946	0.946	0.946	0.946	0.946	0.946;
0.57	0.86	0.91	0.938	0.948	0.952	0.951	0.945	0.94	0.94	0.94	0.94	0.94	0.94	0.94	0.94	0.94	0.94	0.94	0.94	0.94;
0.54	0.85	0.91	0.94	0.948	0.953	0.951	0.945	0.938	0.938	0.938	0.938	0.938	0.938	0.938	0.938	0.938	0.938	0.938	0.938	0.938;
0.58	0.87	0.92	0.941	0.95	0.953	0.947	0.943	0.943	0.943	0.943	0.943	0.943	0.943	0.943	0.943	0.943	0.943	0.943	0.943	0.943;
0.60    0.882	0.925	0.943	0.95	0.95	0.945	0.945	0.945	0.945	0.945	0.945	0.945	0.945	0.945	0.945	0.945	0.945	0.945	0.945	0.945;
0.56	0.882	0.921	0.94	0.946	0.945	0.945	0.945	0.945	0.945	0.945	0.945	0.945	0.945	0.945	0.945	0.945	0.945	0.945	0.945	0.945;
0.54	0.88	0.92	0.938	0.943	0.94	0.94	0.94	0.94	0.94	0.94	0.94	0.94	0.94	0.94	0.94	0.94	0.94	0.94	0.94	0.94;
0.54	0.88	0.917	0.934	0.939	0.937	0.937	0.937	0.937	0.937	0.937	0.937	0.937	0.937	0.937	0.937	0.937	0.937	0.937	0.937	0.937;
0.56	0.88	0.914	0.932	0.936	0.935	0.935	0.935	0.935	0.935	0.935	0.935	0.935	0.935	0.935	0.935	0.935	0.935	0.935	0.935	0.935;
0.64	0.882	0.92	0.933	0.935	0.935	0.935	0.935	0.935	0.935	0.935	0.935	0.935	0.935	0.935	0.935	0.935	0.935	0.935	0.935	0.935;
0.7	    0.883	0.921	0.933	0.93	0.93	0.93	0.93	0.93	0.93	0.93	0.93	0.93	0.93	0.93	0.93	0.93	0.93	0.93	0.93	0.93;
0.72	0.88	0.919	0.929	0.927	0.927	0.927	0.927	0.927	0.927	0.927	0.927	0.927	0.927	0.927	0.927	0.927	0.927	0.927	0.927	0.927;
0.7	    0.87	0.916	0.926	0.926	0.926	0.926	0.926	0.926	0.926	0.926	0.926	0.926	0.926	0.926	0.926	0.926	0.926	0.926	0.926	0.926;
0.68	0.864	0.91	0.923	0.923	0.923	0.923	0.923	0.923	0.923	0.923	0.923	0.923	0.923	0.923	0.923	0.923	0.923	0.923	0.923	0.923;
0.64	0.84	0.9 	0.922	0.922	0.922	0.922	0.922	0.922	0.922	0.922	0.922	0.922	0.922	0.922	0.922	0.922	0.922	0.922	0.922	0.922];

m_map_trq_TwoSided = -200:10:200;
m_eff_map_TwoSided = [fliplr(m_eff_map(:, 2:end)), m_eff_map];

m_eff_map = m_eff_map_TwoSided;
m_map_trq = m_map_trq_TwoSided;

m_max_spd=[0:500:12000]*(2*pi)/60;
m_max_trq=[200 200 200 200 200 194 186 161 142 122 103 90 77.5 70 63.5 58 52 49 45 43 40 37.5 34.3 32.9 31.8]; % (N*m)
m_max_gen_trq = -m_max_trq; % estimate


%% ================================================================== %%
%% Generator
g_inertia=0.0226; % (kg*m^2), rotor's rotational inertia																		

g_map_spd = m_map_spd; % (rad/s)
g_map_trq = m_map_trq*0.7; % (N*m)
g_eff_map = m_eff_map;

g_max_spd = m_max_spd;
g_max_trq = m_max_trq*0.7;

