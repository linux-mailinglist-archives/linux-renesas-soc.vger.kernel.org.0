Return-Path: <linux-renesas-soc+bounces-5975-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 793F790146C
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  9 Jun 2024 06:42:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A0421C20C24
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  9 Jun 2024 04:42:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EB75322A;
	Sun,  9 Jun 2024 04:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ox9oqMkl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FFE4D299
	for <linux-renesas-soc@vger.kernel.org>; Sun,  9 Jun 2024 04:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717908176; cv=none; b=JohGx5IosZ0/O874EZoqMhRqPD892v96X7WbCnusw0NDR82QA35PNe/ls+R2gVM16hE3UNTyr1FhPUJmMVo77JdLSOSmVFuy+Wek5w9aM9zpSaIiCyPj6f07eSA7uLkc9IfA5WLygqKhTg/HcDGRNT4tJy12j/63kEwpiQBLHao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717908176; c=relaxed/simple;
	bh=Vx00j9EWQMo3/IgKj8lqf4gLQbNLeQ6It2d9O/ooB+E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P9FIg+7+i7hJ6c+jxb4aRtxhKzSZiczdoB776TTfJwR8M17b7m9gYJtLOnBeEhIagTRxY7uziSrzttz3y5Fi6sUWiTMTToWssKPHbwgw2g+6TsSrbIeaGHKL17tC0f4MgfxfUIWwEhiFKgpLDceAdwC1hQRI4CqYdZ2R3hlYGBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ox9oqMkl; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717908174; x=1749444174;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vx00j9EWQMo3/IgKj8lqf4gLQbNLeQ6It2d9O/ooB+E=;
  b=Ox9oqMklacHoJXnVpZkvVrKMDkN6PBlgyKmi7RYpC2p2UyGyIAtETgN9
   PmOtoHeX1mjNC+5ev4KlQ2koMnREsbpJ+d+Bv1vYYDYb3ux3YmLYiPSY1
   Dls/Mbh/+Ajo+TKLZ87ZhJgHj0kKXhGU1iGYG/x77sThyUD154+bKeW29
   2a4NyJIZWrY5JjdWCcTZo6BpB8Npr33JJNXcxdG2w8jabsvHT6J/av7b8
   Seon78c+gCc2aXF9HaA5Asiz5n+6OBR8fc/+J6fnlF/KOWS4cMrwav/xP
   GBIt+7RppdrWgWpAFSi6suWkFzcPTntDHHLacPrrpKrp2mA3sWFBPjBUq
   A==;
X-CSE-ConnectionGUID: nkyoWc3rRrOLBsGbpTDj+g==
X-CSE-MsgGUID: E9VWy4eYRfWh/chj9IlItw==
X-IronPort-AV: E=McAfee;i="6600,9927,11097"; a="14330564"
X-IronPort-AV: E=Sophos;i="6.08,224,1712646000"; 
   d="scan'208";a="14330564"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2024 21:42:53 -0700
X-CSE-ConnectionGUID: 2SUFo0l6SGGbKf9gVyuy/Q==
X-CSE-MsgGUID: MgdKRxB+T0681DTbKs8cPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,224,1712646000"; 
   d="scan'208";a="69507586"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 08 Jun 2024 21:42:51 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGAOG-0000qw-2r;
	Sun, 09 Jun 2024 04:42:48 +0000
Date: Sun, 9 Jun 2024 12:42:36 +0800
From: kernel test robot <lkp@intel.com>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: oe-kbuild-all@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [geert-renesas-devel:renesas-dts-for-v6.11 12/12]
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi:956.12-966.7: Warning
 (graph_child_address): /soc/video@e6ef0000/ports/port@2: graph node has
 single child node 'endpoint@0', #address-cells/#size-cells are not necessary
Message-ID: <202406091234.0WUhe1oS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.11
head:   2bb78d9fb7c997f13309838600eead88cc99e96b
commit: 2bb78d9fb7c997f13309838600eead88cc99e96b [12/12] arm64: dts: renesas: r8a779h0: Add video capture nodes
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240609/202406091234.0WUhe1oS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406091234.0WUhe1oS-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a779h0.dtsi:956.12-966.7: Warning (graph_child_address): /soc/video@e6ef0000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a779h0.dtsi:984.12-994.7: Warning (graph_child_address): /soc/video@e6ef1000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1012.12-1022.7: Warning (graph_child_address): /soc/video@e6ef2000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1040.12-1050.7: Warning (graph_child_address): /soc/video@e6ef3000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1068.12-1078.7: Warning (graph_child_address): /soc/video@e6ef4000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1096.12-1106.7: Warning (graph_child_address): /soc/video@e6ef5000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1124.12-1134.7: Warning (graph_child_address): /soc/video@e6ef6000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1152.12-1162.7: Warning (graph_child_address): /soc/video@e6ef7000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1668.12-1678.7: Warning (graph_child_address): /soc/isp@fed00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary

vim +956 arch/arm64/boot/dts/renesas/r8a779h0.dtsi

    11	
    12	/ {
    13		compatible = "renesas,r8a779h0";
    14		#address-cells = <2>;
    15		#size-cells = <2>;
    16	
    17		cluster0_opp: opp-table-0 {
    18			compatible = "operating-points-v2";
    19			opp-shared;
    20	
    21			opp-500000000 {
    22				opp-hz = /bits/ 64 <500000000>;
    23				opp-microvolt = <825000>;
    24				clock-latency-ns = <500000>;
    25			};
    26			opp-1000000000 {
    27				opp-hz = /bits/ 64 <1000000000>;
    28				opp-microvolt = <825000>;
    29				clock-latency-ns = <500000>;
    30			};
    31		};
    32	
    33		cpus {
    34			#address-cells = <1>;
    35			#size-cells = <0>;
    36	
    37			cpu-map {
    38				cluster0 {
    39					core0 {
    40						cpu = <&a76_0>;
    41					};
    42					core1 {
    43						cpu = <&a76_1>;
    44					};
    45					core2 {
    46						cpu = <&a76_2>;
    47					};
    48					core3 {
    49						cpu = <&a76_3>;
    50					};
    51				};
    52			};
    53	
    54			a76_0: cpu@0 {
    55				compatible = "arm,cortex-a76";
    56				reg = <0>;
    57				device_type = "cpu";
    58				power-domains = <&sysc R8A779H0_PD_A1E0D0C0>;
    59				next-level-cache = <&L3_CA76>;
    60				enable-method = "psci";
    61				cpu-idle-states = <&CPU_SLEEP_0>;
    62				clocks = <&cpg CPG_CORE R8A779H0_CLK_ZC0>;
    63				operating-points-v2 = <&cluster0_opp>;
    64			};
    65	
    66			a76_1: cpu@100 {
    67				compatible = "arm,cortex-a76";
    68				reg = <0x100>;
    69				device_type = "cpu";
    70				power-domains = <&sysc R8A779H0_PD_A1E0D0C1>;
    71				next-level-cache = <&L3_CA76>;
    72				enable-method = "psci";
    73				cpu-idle-states = <&CPU_SLEEP_0>;
    74				clocks = <&cpg CPG_CORE R8A779H0_CLK_ZC1>;
    75				operating-points-v2 = <&cluster0_opp>;
    76			};
    77	
    78			a76_2: cpu@200 {
    79				compatible = "arm,cortex-a76";
    80				reg = <0x200>;
    81				device_type = "cpu";
    82				power-domains = <&sysc R8A779H0_PD_A1E0D0C2>;
    83				next-level-cache = <&L3_CA76>;
    84				enable-method = "psci";
    85				cpu-idle-states = <&CPU_SLEEP_0>;
    86				clocks = <&cpg CPG_CORE R8A779H0_CLK_ZC2>;
    87				operating-points-v2 = <&cluster0_opp>;
    88			};
    89	
    90			a76_3: cpu@300 {
    91				compatible = "arm,cortex-a76";
    92				reg = <0x300>;
    93				device_type = "cpu";
    94				power-domains = <&sysc R8A779H0_PD_A1E0D0C3>;
    95				next-level-cache = <&L3_CA76>;
    96				enable-method = "psci";
    97				cpu-idle-states = <&CPU_SLEEP_0>;
    98				clocks = <&cpg CPG_CORE R8A779H0_CLK_ZC3>;
    99				operating-points-v2 = <&cluster0_opp>;
   100			};
   101	
   102			idle-states {
   103				entry-method = "psci";
   104	
   105				CPU_SLEEP_0: cpu-sleep-0 {
   106					compatible = "arm,idle-state";
   107					arm,psci-suspend-param = <0x0010000>;
   108					local-timer-stop;
   109					entry-latency-us = <400>;
   110					exit-latency-us = <500>;
   111					min-residency-us = <4000>;
   112				};
   113			};
   114	
   115			L3_CA76: cache-controller {
   116				compatible = "cache";
   117				power-domains = <&sysc R8A779H0_PD_A2E0D0>;
   118				cache-unified;
   119				cache-level = <3>;
   120			};
   121		};
   122	
   123		extal_clk: extal-clk {
   124			compatible = "fixed-clock";
   125			#clock-cells = <0>;
   126			/* This value must be overridden by the board */
   127			clock-frequency = <0>;
   128		};
   129	
   130		extalr_clk: extalr-clk {
   131			compatible = "fixed-clock";
   132			#clock-cells = <0>;
   133			/* This value must be overridden by the board */
   134			clock-frequency = <0>;
   135		};
   136	
   137		pmu-a76 {
   138			compatible = "arm,cortex-a76-pmu";
   139			interrupts-extended = <&gic GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
   140		};
   141	
   142		psci {
   143			compatible = "arm,psci-1.0", "arm,psci-0.2";
   144			method = "smc";
   145		};
   146	
   147		/* External SCIF clocks - to be overridden by boards that provide them */
   148		scif_clk: scif-clk {
   149			compatible = "fixed-clock";
   150			#clock-cells = <0>;
   151			clock-frequency = <0>;
   152		};
   153	
   154		scif_clk2: scif-clk2 {
   155			compatible = "fixed-clock";
   156			#clock-cells = <0>;
   157			clock-frequency = <0>;
   158		};
   159	
   160		soc: soc {
   161			compatible = "simple-bus";
   162			interrupt-parent = <&gic>;
   163			#address-cells = <2>;
   164			#size-cells = <2>;
   165			ranges;
   166	
   167			rwdt: watchdog@e6020000 {
   168				compatible = "renesas,r8a779h0-wdt",
   169					     "renesas,rcar-gen4-wdt";
   170				reg = <0 0xe6020000 0 0x0c>;
   171				interrupts = <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>;
   172				clocks = <&cpg CPG_MOD 907>;
   173				power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
   174				resets = <&cpg 907>;
   175				status = "disabled";
   176			};
   177	
   178			pfc: pinctrl@e6050000 {
   179				compatible = "renesas,pfc-r8a779h0";
   180				reg = <0 0xe6050000 0 0x16c>, <0 0xe6050800 0 0x16c>,
   181				      <0 0xe6058000 0 0x16c>, <0 0xe6058800 0 0x16c>,
   182				      <0 0xe6060000 0 0x16c>, <0 0xe6060800 0 0x16c>,
   183				      <0 0xe6061000 0 0x16c>, <0 0xe6061800 0 0x16c>;
   184			};
   185	
   186			gpio0: gpio@e6050180 {
   187				compatible = "renesas,gpio-r8a779h0",
   188					     "renesas,rcar-gen4-gpio";
   189				reg = <0 0xe6050180 0 0x54>;
   190				interrupts = <GIC_SPI 619 IRQ_TYPE_LEVEL_HIGH>;
   191				#gpio-cells = <2>;
   192				gpio-controller;
   193				gpio-ranges = <&pfc 0 0 19>;
   194				#interrupt-cells = <2>;
   195				interrupt-controller;
   196				clocks = <&cpg CPG_MOD 915>;
   197				power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
   198				resets = <&cpg 915>;
   199			};
   200	
   201			gpio1: gpio@e6050980 {
   202				compatible = "renesas,gpio-r8a779h0",
   203					     "renesas,rcar-gen4-gpio";
   204				reg = <0 0xe6050980 0 0x54>;
   205				interrupts = <GIC_SPI 623 IRQ_TYPE_LEVEL_HIGH>;
   206				#gpio-cells = <2>;
   207				gpio-controller;
   208				gpio-ranges = <&pfc 0 32 30>;
   209				#interrupt-cells = <2>;
   210				interrupt-controller;
   211				clocks = <&cpg CPG_MOD 915>;
   212				power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
   213				resets = <&cpg 915>;
   214			};
   215	
   216			gpio2: gpio@e6058180 {
   217				compatible = "renesas,gpio-r8a779h0",
   218					     "renesas,rcar-gen4-gpio";
   219				reg = <0 0xe6058180 0 0x54>;
   220				interrupts = <GIC_SPI 627 IRQ_TYPE_LEVEL_HIGH>;
   221				#gpio-cells = <2>;
   222				gpio-controller;
   223				gpio-ranges = <&pfc 0 64 20>;
   224				#interrupt-cells = <2>;
   225				interrupt-controller;
   226				clocks = <&cpg CPG_MOD 916>;
   227				power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
   228				resets = <&cpg 916>;
   229			};
   230	
   231			gpio3: gpio@e6058980 {
   232				compatible = "renesas,gpio-r8a779h0",
   233					     "renesas,rcar-gen4-gpio";
   234				reg = <0 0xe6058980 0 0x54>;
   235				interrupts = <GIC_SPI 631 IRQ_TYPE_LEVEL_HIGH>;
   236				#gpio-cells = <2>;
   237				gpio-controller;
   238				gpio-ranges = <&pfc 0 96 32>;
   239				#interrupt-cells = <2>;
   240				interrupt-controller;
   241				clocks = <&cpg CPG_MOD 916>;
   242				power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
   243				resets = <&cpg 916>;
   244			};
   245	
   246			gpio4: gpio@e6060180 {
   247				compatible = "renesas,gpio-r8a779h0",
   248					     "renesas,rcar-gen4-gpio";
   249				reg = <0 0xe6060180 0 0x54>;
   250				interrupts = <GIC_SPI 635 IRQ_TYPE_LEVEL_HIGH>;
   251				#gpio-cells = <2>;
   252				gpio-controller;
   253				gpio-ranges = <&pfc 0 128 25>;
   254				#interrupt-cells = <2>;
   255				interrupt-controller;
   256				clocks = <&cpg CPG_MOD 917>;
   257				power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
   258				resets = <&cpg 917>;
   259			};
   260	
   261			gpio5: gpio@e6060980 {
   262				compatible = "renesas,gpio-r8a779h0",
   263					     "renesas,rcar-gen4-gpio";
   264				reg = <0 0xe6060980 0 0x54>;
   265				interrupts = <GIC_SPI 639 IRQ_TYPE_LEVEL_HIGH>;
   266				#gpio-cells = <2>;
   267				gpio-controller;
   268				gpio-ranges = <&pfc 0 160 21>;
   269				#interrupt-cells = <2>;
   270				interrupt-controller;
   271				clocks = <&cpg CPG_MOD 917>;
   272				power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
   273				resets = <&cpg 917>;
   274			};
   275	
   276			gpio6: gpio@e6061180 {
   277				compatible = "renesas,gpio-r8a779h0",
   278					     "renesas,rcar-gen4-gpio";
   279				reg = <0 0xe6061180 0 0x54>;
   280				interrupts = <GIC_SPI 643 IRQ_TYPE_LEVEL_HIGH>;
   281				#gpio-cells = <2>;
   282				gpio-controller;
   283				gpio-ranges = <&pfc 0 192 21>;
   284				#interrupt-cells = <2>;
   285				interrupt-controller;
   286				clocks = <&cpg CPG_MOD 917>;
   287				power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
   288				resets = <&cpg 917>;
   289			};
   290	
   291			gpio7: gpio@e6061980 {
   292				compatible = "renesas,gpio-r8a779h0",
   293					     "renesas,rcar-gen4-gpio";
   294				reg = <0 0xe6061980 0 0x54>;
   295				interrupts = <GIC_SPI 647 IRQ_TYPE_LEVEL_HIGH>;
   296				#gpio-cells = <2>;
   297				gpio-controller;
   298				gpio-ranges = <&pfc 0 224 21>;
   299				#interrupt-cells = <2>;
   300				interrupt-controller;
   301				clocks = <&cpg CPG_MOD 917>;
   302				power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
   303				resets = <&cpg 917>;
   304			};
   305	
   306			cmt0: timer@e60f0000 {
   307				compatible = "renesas,r8a779h0-cmt0",
   308					     "renesas,rcar-gen4-cmt0";
   309				reg = <0 0xe60f0000 0 0x1004>;
   310				interrupts = <GIC_SPI 260 IRQ_TYPE_LEVEL_HIGH>,
   311					     <GIC_SPI 261 IRQ_TYPE_LEVEL_HIGH>;
   312				clocks = <&cpg CPG_MOD 910>;
   313				clock-names = "fck";
   314				power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
   315				resets = <&cpg 910>;
   316				status = "disabled";
   317			};
   318	
   319			cmt1: timer@e6130000 {
   320				compatible = "renesas,r8a779h0-cmt1",
   321					     "renesas,rcar-gen4-cmt1";
   322				reg = <0 0xe6130000 0 0x1004>;
   323				interrupts = <GIC_SPI 262 IRQ_TYPE_LEVEL_HIGH>,
   324					     <GIC_SPI 263 IRQ_TYPE_LEVEL_HIGH>,
   325					     <GIC_SPI 264 IRQ_TYPE_LEVEL_HIGH>,
   326					     <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>,
   327					     <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>,
   328					     <GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH>,
   329					     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>,
   330					     <GIC_SPI 269 IRQ_TYPE_LEVEL_HIGH>;
   331				clocks = <&cpg CPG_MOD 911>;
   332				clock-names = "fck";
   333				power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
   334				resets = <&cpg 911>;
   335				status = "disabled";
   336			};
   337	
   338			cmt2: timer@e6140000 {
   339				compatible = "renesas,r8a779h0-cmt1",
   340					     "renesas,rcar-gen4-cmt1";
   341				reg = <0 0xe6140000 0 0x1004>;
   342				interrupts = <GIC_SPI 270 IRQ_TYPE_LEVEL_HIGH>,
   343					     <GIC_SPI 271 IRQ_TYPE_LEVEL_HIGH>,
   344					     <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>,
   345					     <GIC_SPI 273 IRQ_TYPE_LEVEL_HIGH>,
   346					     <GIC_SPI 274 IRQ_TYPE_LEVEL_HIGH>,
   347					     <GIC_SPI 275 IRQ_TYPE_LEVEL_HIGH>,
   348					     <GIC_SPI 276 IRQ_TYPE_LEVEL_HIGH>,
   349					     <GIC_SPI 277 IRQ_TYPE_LEVEL_HIGH>;
   350				clocks = <&cpg CPG_MOD 912>;
   351				clock-names = "fck";
   352				power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
   353				resets = <&cpg 912>;
   354				status = "disabled";
   355			};
   356	
   357			cmt3: timer@e6148000 {
   358				compatible = "renesas,r8a779h0-cmt1",
   359					     "renesas,rcar-gen4-cmt1";
   360				reg = <0 0xe6148000 0 0x1004>;
   361				interrupts = <GIC_SPI 278 IRQ_TYPE_LEVEL_HIGH>,
   362					     <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>,
   363					     <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>,
   364					     <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>,
   365					     <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
   366					     <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
   367					     <GIC_SPI 284 IRQ_TYPE_LEVEL_HIGH>,
   368					     <GIC_SPI 285 IRQ_TYPE_LEVEL_HIGH>;
   369				clocks = <&cpg CPG_MOD 913>;
   370				clock-names = "fck";
   371				power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
   372				resets = <&cpg 913>;
   373				status = "disabled";
   374			};
   375	
   376			cpg: clock-controller@e6150000 {
   377				compatible = "renesas,r8a779h0-cpg-mssr";
   378				reg = <0 0xe6150000 0 0x4000>;
   379				clocks = <&extal_clk>, <&extalr_clk>;
   380				clock-names = "extal", "extalr";
   381				#clock-cells = <2>;
   382				#power-domain-cells = <0>;
   383				#reset-cells = <1>;
   384			};
   385	
   386			rst: reset-controller@e6160000 {
   387				compatible = "renesas,r8a779h0-rst";
   388				reg = <0 0xe6160000 0 0x4000>;
   389			};
   390	
   391			sysc: system-controller@e6180000 {
   392				compatible = "renesas,r8a779h0-sysc";
   393				reg = <0 0xe6180000 0 0x4000>;
   394				#power-domain-cells = <1>;
   395			};
   396	
   397			tsc: thermal@e6198000 {
   398				compatible = "renesas,r8a779h0-thermal";
   399				reg = <0 0xe6198000 0 0x200>,
   400				      <0 0xe61a0000 0 0x200>;
   401				clocks = <&cpg CPG_MOD 919>;
   402				power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
   403				resets = <&cpg 919>;
   404				#thermal-sensor-cells = <1>;
   405			};
   406	
   407			intc_ex: interrupt-controller@e61c0000 {
   408				compatible = "renesas,intc-ex-r8a779h0", "renesas,irqc";
   409				#interrupt-cells = <2>;
   410				interrupt-controller;
   411				reg = <0 0xe61c0000 0 0x200>;
   412				interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
   413					     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
   414					     <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
   415					     <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
   416					     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
   417					     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
   418				clocks = <&cpg CPG_MOD 611>;
   419				power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
   420				resets = <&cpg 611>;
   421			};
   422	
   423			tmu0: timer@e61e0000 {
   424				compatible = "renesas,tmu-r8a779h0", "renesas,tmu";
   425				reg = <0 0xe61e0000 0 0x30>;
   426				interrupts = <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>,
   427					     <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>,
   428					     <GIC_SPI 291 IRQ_TYPE_LEVEL_HIGH>;
   429				interrupt-names = "tuni0", "tuni1", "tuni2";
   430				clocks = <&cpg CPG_MOD 713>;
   431				clock-names = "fck";
   432				power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
   433				resets = <&cpg 713>;
   434				status = "disabled";
   435			};
   436	
   437			tmu1: timer@e6fc0000 {
   438				compatible = "renesas,tmu-r8a779h0", "renesas,tmu";
   439				reg = <0 0xe6fc0000 0 0x30>;
   440				interrupts = <GIC_SPI 292 IRQ_TYPE_LEVEL_HIGH>,
   441					     <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
   442					     <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH>,
   443					     <GIC_SPI 295 IRQ_TYPE_LEVEL_HIGH>;
   444				interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
   445				clocks = <&cpg CPG_MOD 714>;
   446				clock-names = "fck";
   447				power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
   448				resets = <&cpg 714>;
   449				status = "disabled";
   450			};
   451	
   452			tmu2: timer@e6fd0000 {
   453				compatible = "renesas,tmu-r8a779h0", "renesas,tmu";
   454				reg = <0 0xe6fd0000 0 0x30>;
   455				interrupts = <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>,
   456					     <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
   457					     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>,
   458					     <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>;
   459				interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
   460				clocks = <&cpg CPG_MOD 715>;
   461				clock-names = "fck";
   462				power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
   463				resets = <&cpg 715>;
   464				status = "disabled";
   465			};
   466	
   467			tmu3: timer@e6fe0000 {
   468				compatible = "renesas,tmu-r8a779h0", "renesas,tmu";
   469				reg = <0 0xe6fe0000 0 0x30>;
   470				interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>,
   471					     <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>,
   472					     <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>,
   473					     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH>;
   474				interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
   475				clocks = <&cpg CPG_MOD 716>;
   476				clock-names = "fck";
   477				power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
   478				resets = <&cpg 716>;
   479				status = "disabled";
   480			};
   481	
   482			tmu4: timer@ffc00000 {
   483				compatible = "renesas,tmu-r8a779h0", "renesas,tmu";
   484				reg = <0 0xffc00000 0 0x30>;
   485				interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
   486					     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>,
   487					     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>,
   488					     <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>;
   489				interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
   490				clocks = <&cpg CPG_MOD 717>;
   491				clock-names = "fck";
   492				power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
   493				resets = <&cpg 717>;
   494				status = "disabled";
   495			};
   496	
   497			i2c0: i2c@e6500000 {
   498				compatible = "renesas,i2c-r8a779h0",
   499					     "renesas,rcar-gen4-i2c";
   500				reg = <0 0xe6500000 0 0x40>;
   501				interrupts = <GIC_SPI 610 IRQ_TYPE_LEVEL_HIGH>;
   502				clocks = <&cpg CPG_MOD 518>;
   503				power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
   504				resets = <&cpg 518>;
   505				dmas = <&dmac1 0x91>, <&dmac1 0x90>,
   506				       <&dmac2 0x91>, <&dmac2 0x90>;
   507				dma-names = "tx", "rx", "tx", "rx";
   508				i2c-scl-internal-delay-ns = <110>;
   509				#address-cells = <1>;
   510				#size-cells = <0>;
   511				status = "disabled";
   512			};
   513	
   514			i2c1: i2c@e6508000 {
   515				compatible = "renesas,i2c-r8a779h0",
   516					     "renesas,rcar-gen4-i2c";
   517				reg = <0 0xe6508000 0 0x40>;
   518				interrupts = <GIC_SPI 611 IRQ_TYPE_LEVEL_HIGH>;
   519				clocks = <&cpg CPG_MOD 519>;
   520				power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
   521				resets = <&cpg 519>;
   522				dmas = <&dmac1 0x93>, <&dmac1 0x92>,
   523				       <&dmac2 0x93>, <&dmac2 0x92>;
   524				dma-names = "tx", "rx", "tx", "rx";
   525				i2c-scl-internal-delay-ns = <110>;
   526				#address-cells = <1>;
   527				#size-cells = <0>;
   528				status = "disabled";
   529			};
   530	
   531			i2c2: i2c@e6510000 {
   532				compatible = "renesas,i2c-r8a779h0",
   533					     "renesas,rcar-gen4-i2c";
   534				reg = <0 0xe6510000 0 0x40>;
   535				interrupts = <GIC_SPI 612 IRQ_TYPE_LEVEL_HIGH>;
   536				clocks = <&cpg CPG_MOD 520>;
   537				power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
   538				resets = <&cpg 520>;
   539				dmas = <&dmac1 0x95>, <&dmac1 0x94>,
   540				       <&dmac2 0x95>, <&dmac2 0x94>;
   541				dma-names = "tx", "rx", "tx", "rx";
   542				i2c-scl-internal-delay-ns = <110>;
   543				#address-cells = <1>;
   544				#size-cells = <0>;
   545				status = "disabled";
   546			};
   547	
   548			i2c3: i2c@e66d0000 {
   549				compatible = "renesas,i2c-r8a779h0",
   550					     "renesas,rcar-gen4-i2c";
   551				reg = <0 0xe66d0000 0 0x40>;
   552				interrupts = <GIC_SPI 613 IRQ_TYPE_LEVEL_HIGH>;
   553				clocks = <&cpg CPG_MOD 521>;
   554				power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
   555				resets = <&cpg 521>;
   556				dmas = <&dmac1 0x97>, <&dmac1 0x96>,
   557				       <&dmac2 0x97>, <&dmac2 0x96>;
   558				dma-names = "tx", "rx", "tx", "rx";
   559				i2c-scl-internal-delay-ns = <110>;
   560				#address-cells = <1>;
   561				#size-cells = <0>;
   562				status = "disabled";
   563			};
   564	
   565			hscif0: serial@e6540000 {
   566				compatible = "renesas,hscif-r8a779h0",
   567					     "renesas,rcar-gen4-hscif", "renesas,hscif";
   568				reg = <0 0xe6540000 0 0x60>;
   569				interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
   570				clocks = <&cpg CPG_MOD 514>,
   571					 <&cpg CPG_CORE R8A779H0_CLK_SASYNCPERD1>,
   572					 <&scif_clk>;
   573				clock-names = "fck", "brg_int", "scif_clk";
   574				power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
   575				resets = <&cpg 514>;
   576				dmas = <&dmac1 0x31>, <&dmac1 0x30>,
   577				       <&dmac2 0x31>, <&dmac2 0x30>;
   578				dma-names = "tx", "rx", "tx", "rx";
   579				status = "disabled";
   580			};
   581	
   582			hscif1: serial@e6550000 {
   583				compatible = "renesas,hscif-r8a779h0",
   584					     "renesas,rcar-gen4-hscif", "renesas,hscif";
   585				reg = <0 0xe6550000 0 0x60>;
   586				interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>;
   587				clocks = <&cpg CPG_MOD 515>,
   588					 <&cpg CPG_CORE R8A779H0_CLK_SASYNCPERD1>,
   589					 <&scif_clk>;
   590				clock-names = "fck", "brg_int", "scif_clk";
   591				power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
   592				resets = <&cpg 515>;
   593				dmas = <&dmac1 0x33>, <&dmac1 0x32>,
   594				       <&dmac2 0x33>, <&dmac2 0x32>;
   595				dma-names = "tx", "rx", "tx", "rx";
   596				status = "disabled";
   597			};
   598	
   599			hscif2: serial@e6560000 {
   600				compatible = "renesas,hscif-r8a779h0",
   601					     "renesas,rcar-gen4-hscif", "renesas,hscif";
   602				reg = <0 0xe6560000 0 0x60>;
   603				interrupts = <GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>;
   604				clocks = <&cpg CPG_MOD 516>,
   605					 <&cpg CPG_CORE R8A779H0_CLK_SASYNCPERD1>,
   606					 <&scif_clk2>;
   607				clock-names = "fck", "brg_int", "scif_clk";
   608				power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
   609				resets = <&cpg 516>;
   610				dmas = <&dmac1 0x35>, <&dmac1 0x34>,
   611				       <&dmac2 0x35>, <&dmac2 0x34>;
   612				dma-names = "tx", "rx", "tx", "rx";
   613				status = "disabled";
   614			};
   615	
   616			hscif3: serial@e66a0000 {
   617				compatible = "renesas,hscif-r8a779h0",
   618					     "renesas,rcar-gen4-hscif", "renesas,hscif";
   619				reg = <0 0xe66a0000 0 0x60>;
   620				interrupts = <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>;
   621				clocks = <&cpg CPG_MOD 517>,
   622					 <&cpg CPG_CORE R8A779H0_CLK_SASYNCPERD1>,
   623					 <&scif_clk>;
   624				clock-names = "fck", "brg_int", "scif_clk";
   625				power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
   626				resets = <&cpg 517>;
   627				dmas = <&dmac1 0x37>, <&dmac1 0x36>,
   628				       <&dmac2 0x37>, <&dmac2 0x36>;
   629				dma-names = "tx", "rx", "tx", "rx";
   630				status = "disabled";
   631			};
   632	
   633			avb0: ethernet@e6800000 {
   634				compatible = "renesas,etheravb-r8a779h0",
   635					     "renesas,etheravb-rcar-gen4";
   636				reg = <0 0xe6800000 0 0x1000>;
   637				interrupts = <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>,
   638					     <GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH>,
   639					     <GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH>,
   640					     <GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH>,
   641					     <GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH>,
   642					     <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>,
   643					     <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH>,
   644					     <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH>,
   645					     <GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH>,
   646					     <GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH>,
   647					     <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>,
   648					     <GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH>,
   649					     <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH>,
   650					     <GIC_SPI 348 IRQ_TYPE_LEVEL_HIGH>,
   651					     <GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH>,
   652					     <GIC_SPI 350 IRQ_TYPE_LEVEL_HIGH>,
   653					     <GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH>,
   654					     <GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>,
   655					     <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>,
   656					     <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>,
   657					     <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>,
   658					     <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>,
   659					     <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>,
   660					     <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>,
   661					     <GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH>;
   662				interrupt-names = "ch0", "ch1", "ch2", "ch3",
   663						  "ch4", "ch5", "ch6", "ch7",
   664						  "ch8", "ch9", "ch10", "ch11",
   665						  "ch12", "ch13", "ch14", "ch15",
   666						  "ch16", "ch17", "ch18", "ch19",
   667						  "ch20", "ch21", "ch22", "ch23",
   668						  "ch24";
   669				clocks = <&cpg CPG_MOD 211>;
   670				clock-names = "fck";
   671				power-domains = <&sysc R8A779H0_PD_C4>;
   672				resets = <&cpg 211>;
   673				phy-mode = "rgmii";
   674				rx-internal-delay-ps = <0>;
   675				tx-internal-delay-ps = <0>;
   676				iommus = <&ipmmu_hc 0>;
   677				#address-cells = <1>;
   678				#size-cells = <0>;
   679				status = "disabled";
   680			};
   681	
   682			avb1: ethernet@e6810000 {
   683				compatible = "renesas,etheravb-r8a779h0",
   684					     "renesas,etheravb-rcar-gen4";
   685				reg = <0 0xe6810000 0 0x1000>;
   686				interrupts = <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>,
   687					     <GIC_SPI 361 IRQ_TYPE_LEVEL_HIGH>,
   688					     <GIC_SPI 362 IRQ_TYPE_LEVEL_HIGH>,
   689					     <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH>,
   690					     <GIC_SPI 364 IRQ_TYPE_LEVEL_HIGH>,
   691					     <GIC_SPI 365 IRQ_TYPE_LEVEL_HIGH>,
   692					     <GIC_SPI 366 IRQ_TYPE_LEVEL_HIGH>,
   693					     <GIC_SPI 367 IRQ_TYPE_LEVEL_HIGH>,
   694					     <GIC_SPI 368 IRQ_TYPE_LEVEL_HIGH>,
   695					     <GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH>,
   696					     <GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>,
   697					     <GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>,
   698					     <GIC_SPI 372 IRQ_TYPE_LEVEL_HIGH>,
   699					     <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>,
   700					     <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH>,
   701					     <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>,
   702					     <GIC_SPI 376 IRQ_TYPE_LEVEL_HIGH>,
   703					     <GIC_SPI 377 IRQ_TYPE_LEVEL_HIGH>,
   704					     <GIC_SPI 378 IRQ_TYPE_LEVEL_HIGH>,
   705					     <GIC_SPI 379 IRQ_TYPE_LEVEL_HIGH>,
   706					     <GIC_SPI 380 IRQ_TYPE_LEVEL_HIGH>,
   707					     <GIC_SPI 381 IRQ_TYPE_LEVEL_HIGH>,
   708					     <GIC_SPI 382 IRQ_TYPE_LEVEL_HIGH>,
   709					     <GIC_SPI 383 IRQ_TYPE_LEVEL_HIGH>,
   710					     <GIC_SPI 384 IRQ_TYPE_LEVEL_HIGH>;
   711				interrupt-names = "ch0", "ch1", "ch2", "ch3",
   712						  "ch4", "ch5", "ch6", "ch7",
   713						  "ch8", "ch9", "ch10", "ch11",
   714						  "ch12", "ch13", "ch14", "ch15",
   715						  "ch16", "ch17", "ch18", "ch19",
   716						  "ch20", "ch21", "ch22", "ch23",
   717						  "ch24";
   718				clocks = <&cpg CPG_MOD 212>;
   719				clock-names = "fck";
   720				power-domains = <&sysc R8A779H0_PD_C4>;
   721				resets = <&cpg 212>;
   722				phy-mode = "rgmii";
   723				rx-internal-delay-ps = <0>;
   724				tx-internal-delay-ps = <0>;
   725				#address-cells = <1>;
   726				#size-cells = <0>;
   727				status = "disabled";
   728			};
   729	
   730			avb2: ethernet@e6820000 {
   731				compatible = "renesas,etheravb-r8a779h0",
   732					     "renesas,etheravb-rcar-gen4";
   733				reg = <0 0xe6820000 0 0x1000>;
   734				interrupts = <GIC_SPI 385 IRQ_TYPE_LEVEL_HIGH>,
   735					     <GIC_SPI 386 IRQ_TYPE_LEVEL_HIGH>,
   736					     <GIC_SPI 387 IRQ_TYPE_LEVEL_HIGH>,
   737					     <GIC_SPI 388 IRQ_TYPE_LEVEL_HIGH>,
   738					     <GIC_SPI 389 IRQ_TYPE_LEVEL_HIGH>,
   739					     <GIC_SPI 390 IRQ_TYPE_LEVEL_HIGH>,
   740					     <GIC_SPI 391 IRQ_TYPE_LEVEL_HIGH>,
   741					     <GIC_SPI 392 IRQ_TYPE_LEVEL_HIGH>,
   742					     <GIC_SPI 393 IRQ_TYPE_LEVEL_HIGH>,
   743					     <GIC_SPI 394 IRQ_TYPE_LEVEL_HIGH>,
   744					     <GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>,
   745					     <GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH>,
   746					     <GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>,
   747					     <GIC_SPI 398 IRQ_TYPE_LEVEL_HIGH>,
   748					     <GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>,
   749					     <GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>,
   750					     <GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>,
   751					     <GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>,
   752					     <GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>,
   753					     <GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH>,
   754					     <GIC_SPI 405 IRQ_TYPE_LEVEL_HIGH>,
   755					     <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>,
   756					     <GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH>,
   757					     <GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH>,
   758					     <GIC_SPI 409 IRQ_TYPE_LEVEL_HIGH>;
   759				interrupt-names = "ch0", "ch1", "ch2", "ch3",
   760						  "ch4", "ch5", "ch6", "ch7",
   761						  "ch8", "ch9", "ch10", "ch11",
   762						  "ch12", "ch13", "ch14", "ch15",
   763						  "ch16", "ch17", "ch18", "ch19",
   764						  "ch20", "ch21", "ch22", "ch23",
   765						  "ch24";
   766				clocks = <&cpg CPG_MOD 213>;
   767				clock-names = "fck";
   768				power-domains = <&sysc R8A779H0_PD_C4>;
   769				resets = <&cpg 213>;
   770				phy-mode = "rgmii";
   771				rx-internal-delay-ps = <0>;
   772				tx-internal-delay-ps = <0>;
   773				#address-cells = <1>;
   774				#size-cells = <0>;
   775				status = "disabled";
   776			};
   777	
   778			scif0: serial@e6e60000 {
   779				compatible = "renesas,scif-r8a779h0",
   780					     "renesas,rcar-gen4-scif", "renesas,scif";
   781				reg = <0 0xe6e60000 0 64>;
   782				interrupts = <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH>;
   783				clocks = <&cpg CPG_MOD 702>,
   784					 <&cpg CPG_CORE R8A779H0_CLK_SASYNCPERD1>,
   785					 <&scif_clk>;
   786				clock-names = "fck", "brg_int", "scif_clk";
   787				power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
   788				resets = <&cpg 702>;
   789				dmas = <&dmac1 0x51>, <&dmac1 0x50>,
   790				       <&dmac2 0x51>, <&dmac2 0x50>;
   791				dma-names = "tx", "rx", "tx", "rx";
   792				status = "disabled";
   793			};
   794	
   795			scif1: serial@e6e68000 {
   796				compatible = "renesas,scif-r8a779h0",
   797					     "renesas,rcar-gen4-scif", "renesas,scif";
   798				reg = <0 0xe6e68000 0 64>;
   799				interrupts = <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH>;
   800				clocks = <&cpg CPG_MOD 703>,
   801					 <&cpg CPG_CORE R8A779H0_CLK_SASYNCPERD1>,
   802					 <&scif_clk>;
   803				clock-names = "fck", "brg_int", "scif_clk";
   804				power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
   805				resets = <&cpg 703>;
   806				dmas = <&dmac1 0x53>, <&dmac1 0x52>,
   807				       <&dmac2 0x53>, <&dmac2 0x52>;
   808				dma-names = "tx", "rx", "tx", "rx";
   809				status = "disabled";
   810			};
   811	
   812			scif3: serial@e6c50000 {
   813				compatible = "renesas,scif-r8a779h0",
   814					     "renesas,rcar-gen4-scif", "renesas,scif";
   815				reg = <0 0xe6c50000 0 64>;
   816				interrupts = <GIC_SPI 253 IRQ_TYPE_LEVEL_HIGH>;
   817				clocks = <&cpg CPG_MOD 704>,
   818					 <&cpg CPG_CORE R8A779H0_CLK_SASYNCPERD1>,
   819					 <&scif_clk>;
   820				clock-names = "fck", "brg_int", "scif_clk";
   821				power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
   822				resets = <&cpg 704>;
   823				dmas = <&dmac1 0x57>, <&dmac1 0x56>,
   824				       <&dmac2 0x57>, <&dmac2 0x56>;
   825				dma-names = "tx", "rx", "tx", "rx";
   826				status = "disabled";
   827			};
   828	
   829			scif4: serial@e6c40000 {
   830				compatible = "renesas,scif-r8a779h0",
   831					     "renesas,rcar-gen4-scif", "renesas,scif";
   832				reg = <0 0xe6c40000 0 64>;
   833				interrupts = <GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH>;
   834				clocks = <&cpg CPG_MOD 705>,
   835					 <&cpg CPG_CORE R8A779H0_CLK_SASYNCPERD1>,
   836					 <&scif_clk2>;
   837				clock-names = "fck", "brg_int", "scif_clk";
   838				power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
   839				resets = <&cpg 705>;
   840				dmas = <&dmac1 0x59>, <&dmac1 0x58>,
   841				       <&dmac2 0x59>, <&dmac2 0x58>;
   842				dma-names = "tx", "rx", "tx", "rx";
   843				status = "disabled";
   844			};
   845	
   846			msiof0: spi@e6e90000 {
   847				compatible = "renesas,msiof-r8a779h0",
   848					     "renesas,rcar-gen4-msiof";
   849				reg = <0 0xe6e90000 0 0x0064>;
   850				interrupts = <GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH>;
   851				clocks = <&cpg CPG_MOD 618>;
   852				dmas = <&dmac1 0x41>, <&dmac1 0x40>,
   853				       <&dmac2 0x41>, <&dmac2 0x40>;
   854				dma-names = "tx", "rx", "tx", "rx";
   855				power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
   856				resets = <&cpg 618>;
   857				#address-cells = <1>;
   858				#size-cells = <0>;
   859				status = "disabled";
   860			};
   861	
   862			msiof1: spi@e6ea0000 {
   863				compatible = "renesas,msiof-r8a779h0",
   864					     "renesas,rcar-gen4-msiof";
   865				reg = <0 0xe6ea0000 0 0x0064>;
   866				interrupts = <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>;
   867				clocks = <&cpg CPG_MOD 619>;
   868				dmas = <&dmac1 0x43>, <&dmac1 0x42>,
   869				       <&dmac2 0x43>, <&dmac2 0x42>;
   870				dma-names = "tx", "rx", "tx", "rx";
   871				power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
   872				resets = <&cpg 619>;
   873				#address-cells = <1>;
   874				#size-cells = <0>;
   875				status = "disabled";
   876			};
   877	
   878			msiof2: spi@e6c00000 {
   879				compatible = "renesas,msiof-r8a779h0",
   880					     "renesas,rcar-gen4-msiof";
   881				reg = <0 0xe6c00000 0 0x0064>;
   882				interrupts = <GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>;
   883				clocks = <&cpg CPG_MOD 620>;
   884				dmas = <&dmac1 0x45>, <&dmac1 0x44>,
   885				       <&dmac2 0x45>, <&dmac2 0x44>;
   886				dma-names = "tx", "rx", "tx", "rx";
   887				power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
   888				resets = <&cpg 620>;
   889				#address-cells = <1>;
   890				#size-cells = <0>;
   891				status = "disabled";
   892			};
   893	
   894			msiof3: spi@e6c10000 {
   895				compatible = "renesas,msiof-r8a779h0",
   896					     "renesas,rcar-gen4-msiof";
   897				reg = <0 0xe6c10000 0 0x0064>;
   898				interrupts = <GIC_SPI 242 IRQ_TYPE_LEVEL_HIGH>;
   899				clocks = <&cpg CPG_MOD 621>;
   900				dmas = <&dmac1 0x47>, <&dmac1 0x46>,
   901				       <&dmac2 0x47>, <&dmac2 0x46>;
   902				dma-names = "tx", "rx", "tx", "rx";
   903				power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
   904				resets = <&cpg 621>;
   905				#address-cells = <1>;
   906				#size-cells = <0>;
   907				status = "disabled";
   908			};
   909	
   910			msiof4: spi@e6c20000 {
   911				compatible = "renesas,msiof-r8a779h0",
   912					     "renesas,rcar-gen4-msiof";
   913				reg = <0 0xe6c20000 0 0x0064>;
   914				interrupts = <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>;
   915				clocks = <&cpg CPG_MOD 622>;
   916				dmas = <&dmac1 0x49>, <&dmac1 0x48>,
   917				       <&dmac2 0x49>, <&dmac2 0x48>;
   918				dma-names = "tx", "rx", "tx", "rx";
   919				power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
   920				resets = <&cpg 622>;
   921				#address-cells = <1>;
   922				#size-cells = <0>;
   923				status = "disabled";
   924			};
   925	
   926			msiof5: spi@e6c28000 {
   927				compatible = "renesas,msiof-r8a779h0",
   928					     "renesas,rcar-gen4-msiof";
   929				reg = <0 0xe6c28000 0 0x0064>;
   930				interrupts = <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>;
   931				clocks = <&cpg CPG_MOD 623>;
   932				dmas = <&dmac1 0x4b>, <&dmac1 0x4a>,
   933				       <&dmac2 0x4b>, <&dmac2 0x4a>;
   934				dma-names = "tx", "rx", "tx", "rx";
   935				power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
   936				resets = <&cpg 623>;
   937				#address-cells = <1>;
   938				#size-cells = <0>;
   939				status = "disabled";
   940			};
   941	
   942			vin00: video@e6ef0000 {
   943				compatible = "renesas,vin-r8a779h0";
   944				reg = <0 0xe6ef0000 0 0x1000>;
   945				interrupts = <GIC_SPI 529 IRQ_TYPE_LEVEL_HIGH>;
   946				clocks = <&cpg CPG_MOD 730>;
   947				power-domains = <&sysc R8A779H0_PD_C4>;
   948				resets = <&cpg 730>;
   949				renesas,id = <0>;
   950				status = "disabled";
   951	
   952				ports {
   953					#address-cells = <1>;
   954					#size-cells = <0>;
   955	
 > 956					port@2 {
   957						#address-cells = <1>;
   958						#size-cells = <0>;
   959	
   960						reg = <2>;
   961	
   962						vin00isp0: endpoint@0 {
   963							reg = <0>;
   964							remote-endpoint = <&isp0vin00>;
   965						};
   966					};
   967				};
   968			};
   969	
   970			vin01: video@e6ef1000 {
   971				compatible = "renesas,vin-r8a779h0";
   972				reg = <0 0xe6ef1000 0 0x1000>;
   973				interrupts = <GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH>;
   974				clocks = <&cpg CPG_MOD 731>;
   975				power-domains = <&sysc R8A779H0_PD_C4>;
   976				resets = <&cpg 731>;
   977				renesas,id = <1>;
   978				status = "disabled";
   979	
   980				ports {
   981					#address-cells = <1>;
   982					#size-cells = <0>;
   983	
 > 984					port@2 {
   985						#address-cells = <1>;
   986						#size-cells = <0>;
   987	
   988						reg = <2>;
   989	
   990						vin01isp0: endpoint@0 {
   991							reg = <0>;
   992							remote-endpoint = <&isp0vin01>;
   993						};
   994					};
   995				};
   996			};
   997	
   998			vin02: video@e6ef2000 {
   999				compatible = "renesas,vin-r8a779h0";
  1000				reg = <0 0xe6ef2000 0 0x1000>;
  1001				interrupts = <GIC_SPI 531 IRQ_TYPE_LEVEL_HIGH>;
  1002				clocks = <&cpg CPG_MOD 800>;
  1003				power-domains = <&sysc R8A779H0_PD_C4>;
  1004				resets = <&cpg 800>;
  1005				renesas,id = <2>;
  1006				status = "disabled";
  1007	
  1008				ports {
  1009					#address-cells = <1>;
  1010					#size-cells = <0>;
  1011	
> 1012					port@2 {
  1013						#address-cells = <1>;
  1014						#size-cells = <0>;
  1015	
  1016						reg = <2>;
  1017	
  1018						vin02isp0: endpoint@0 {
  1019							reg = <0>;
  1020							remote-endpoint = <&isp0vin02>;
  1021						};
  1022					};
  1023				};
  1024			};
  1025	
  1026			vin03: video@e6ef3000 {
  1027				compatible = "renesas,vin-r8a779h0";
  1028				reg = <0 0xe6ef3000 0 0x1000>;
  1029				interrupts = <GIC_SPI 532 IRQ_TYPE_LEVEL_HIGH>;
  1030				clocks = <&cpg CPG_MOD 801>;
  1031				power-domains = <&sysc R8A779H0_PD_C4>;
  1032				resets = <&cpg 801>;
  1033				renesas,id = <3>;
  1034				status = "disabled";
  1035	
  1036				ports {
  1037					#address-cells = <1>;
  1038					#size-cells = <0>;
  1039	
> 1040					port@2 {
  1041						#address-cells = <1>;
  1042						#size-cells = <0>;
  1043	
  1044						reg = <2>;
  1045	
  1046						vin03isp0: endpoint@0 {
  1047							reg = <0>;
  1048							remote-endpoint = <&isp0vin03>;
  1049						};
  1050					};
  1051				};
  1052			};
  1053	
  1054			vin04: video@e6ef4000 {
  1055				compatible = "renesas,vin-r8a779h0";
  1056				reg = <0 0xe6ef4000 0 0x1000>;
  1057				interrupts = <GIC_SPI 533 IRQ_TYPE_LEVEL_HIGH>;
  1058				clocks = <&cpg CPG_MOD 802>;
  1059				power-domains = <&sysc R8A779H0_PD_C4>;
  1060				resets = <&cpg 802>;
  1061				renesas,id = <4>;
  1062				status = "disabled";
  1063	
  1064				ports {
  1065					#address-cells = <1>;
  1066					#size-cells = <0>;
  1067	
> 1068					port@2 {
  1069						#address-cells = <1>;
  1070						#size-cells = <0>;
  1071	
  1072						reg = <2>;
  1073	
  1074						vin04isp0: endpoint@0 {
  1075							reg = <0>;
  1076							remote-endpoint = <&isp0vin04>;
  1077						};
  1078					};
  1079				};
  1080			};
  1081	
  1082			vin05: video@e6ef5000 {
  1083				compatible = "renesas,vin-r8a779h0";
  1084				reg = <0 0xe6ef5000 0 0x1000>;
  1085				interrupts = <GIC_SPI 534 IRQ_TYPE_LEVEL_HIGH>;
  1086				clocks = <&cpg CPG_MOD 803>;
  1087				power-domains = <&sysc R8A779H0_PD_C4>;
  1088				resets = <&cpg 803>;
  1089				renesas,id = <5>;
  1090				status = "disabled";
  1091	
  1092				ports {
  1093					#address-cells = <1>;
  1094					#size-cells = <0>;
  1095	
> 1096					port@2 {
  1097						#address-cells = <1>;
  1098						#size-cells = <0>;
  1099	
  1100						reg = <2>;
  1101	
  1102						vin05isp0: endpoint@0 {
  1103							reg = <0>;
  1104							remote-endpoint = <&isp0vin05>;
  1105						};
  1106					};
  1107				};
  1108			};
  1109	
  1110			vin06: video@e6ef6000 {
  1111				compatible = "renesas,vin-r8a779h0";
  1112				reg = <0 0xe6ef6000 0 0x1000>;
  1113				interrupts = <GIC_SPI 535 IRQ_TYPE_LEVEL_HIGH>;
  1114				clocks = <&cpg CPG_MOD 804>;
  1115				power-domains = <&sysc R8A779H0_PD_C4>;
  1116				resets = <&cpg 804>;
  1117				renesas,id = <6>;
  1118				status = "disabled";
  1119	
  1120				ports {
  1121					#address-cells = <1>;
  1122					#size-cells = <0>;
  1123	
> 1124					port@2 {
  1125						#address-cells = <1>;
  1126						#size-cells = <0>;
  1127	
  1128						reg = <2>;
  1129	
  1130						vin06isp0: endpoint@0 {
  1131							reg = <0>;
  1132							remote-endpoint = <&isp0vin06>;
  1133						};
  1134					};
  1135				};
  1136			};
  1137	
  1138			vin07: video@e6ef7000 {
  1139				compatible = "renesas,vin-r8a779h0";
  1140				reg = <0 0xe6ef7000 0 0x1000>;
  1141				interrupts = <GIC_SPI 536 IRQ_TYPE_LEVEL_HIGH>;
  1142				clocks = <&cpg CPG_MOD 805>;
  1143				power-domains = <&sysc R8A779H0_PD_C4>;
  1144				resets = <&cpg 805>;
  1145				renesas,id = <7>;
  1146				status = "disabled";
  1147	
  1148				ports {
  1149					#address-cells = <1>;
  1150					#size-cells = <0>;
  1151	
> 1152					port@2 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

