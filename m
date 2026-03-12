Return-Path: <linux-renesas-soc+bounces-29260-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPeCKjBbsmngLwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29260-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 07:20:32 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DAFD26D963
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 07:20:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE7F73034540
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 06:20:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C3B12874E0;
	Thu, 12 Mar 2026 06:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RROTAhPt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1482C359A86;
	Thu, 12 Mar 2026 06:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773296429; cv=fail; b=EHXYH2Zkpj9SP9m5zGE6IF02uxto2Wn3Z2iBYjabcUPfUs3WPqT879U616KlgM5FpLNca7V8ABM/MZb0bwFSBI3lu2C31Cxsj82+kOFksTyi97BpWqSJl9Ojgxa63invXQd7lu3H47B2w8LPZKlSJvW0TyqLGnFmwXoL70IjpbY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773296429; c=relaxed/simple;
	bh=SoCxxi0taaFRWzAHHOFvUmh1dhdFPIfh0RQuA+BtSHw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rvgHte26l3VMT21wx4dna09lsEAHD21+9D+9P07U1WGpJVCyTGdUIltGrT6LC3Pl5XQ2NBOqj5b3hVzCV0rGFRY8q7MwksTdCZkQNVpJRm+kXXUzvE6L+DMilOBWpnIpX+2DHIAgzEQs/khW9CWVlsk9rHsJGG2Cq/r2FWObKwc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RROTAhPt; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773296425; x=1804832425;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=SoCxxi0taaFRWzAHHOFvUmh1dhdFPIfh0RQuA+BtSHw=;
  b=RROTAhPt+Q4vI1Nae2kmIhTmUvHBP67bDij/xtiAG/4sa2/JtiVkwg2x
   qgC/4+ERUfHVvDnccs7DDDH0xh6XN+7N3IBCpgDFHnCaLcDVOsBsBHODj
   L4ClSSNzb4j55eqCNT3/tPBZF3oS2S3RCkHTqw93ELzni4ejpZMrmgKqt
   fCTm6+rt2QaJtrtUOm74iDesJD/3NdWQO7McrwQckvDDySipJCmry4y5K
   sa9daAhd0cunCNkwigEqlDj3UCYpfeV0zuKuMBmWyWjKSTMnfjywpz9W+
   Nwjve5ugKOzT2k1an0QC4S2+eC67HCKHORIC0G6X5SwC1lF1zpC7AVfXW
   Q==;
X-CSE-ConnectionGUID: b17F1t9HSLyUDgtnaXPsog==
X-CSE-MsgGUID: Q2i9xfMsRFy8XbV1L5g0fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="77983269"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; 
   d="scan'208";a="77983269"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 23:20:24 -0700
X-CSE-ConnectionGUID: ZJtuWIsCRxm3mEAyRvoQLA==
X-CSE-MsgGUID: mlidAIMtRqOwrdoKjVWPsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; 
   d="scan'208";a="258621544"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 23:20:24 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 23:20:23 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 11 Mar 2026 23:20:23 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.62) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 23:20:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GPrsX9zyiNcMbCnjDJ3uNd/FvQgSi+r/IxsNwq7s9vve54Fe/azvl7QRBD1MkMdLAQ905VGUJlshcG5w3lKWO3PAGbYu6yqwKhyvyZ+OKvFpZTPyz1sTqjXrqk1p1yNa193B8YF+gtzLJkxfLKYM6AW5l+3hVJtVLtQekdE6hnffiCFYfvAWEBJLi3WquYKafOYemuEy61GK5gndFxVLjJFXtUiWvx1wIVkSOccWfF7ujC+Mp1QGU6JQlsvwX6jlYwPoM5RI5RThXUmE7Loz/ndqv/0TcpMF8yzxHQaiU9GA2dlZvW1awm8mocrZMRm7hAWIw6YQAfJ5EBN3Jtg4UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SoCxxi0taaFRWzAHHOFvUmh1dhdFPIfh0RQuA+BtSHw=;
 b=DMfK43Um+N+vpwFCpOSQD3Lj2rTewo2PzH/A2vL1ll7/kkwCVrLSyW8jRzSiwyEBUNF8cGz4u90wCBsLKSU2Cr712BuiA3a6QxWJVSAFo8WajOtJ61TaJKv2gn0INm5FryvlvW3zQ7ZyoxztFmuq7b1pgNPZEXfxDLJjiSCLeKWezhsbMcL/Seg+y2DlmzeBtMrV1EXkaS+NmOV4/RQ1UTp/6lQEMSj7edCNN5Hnjw7GtOuJaxBYcxGnvNimV5ZwTjIgdPW5urtvqWDUtQ8Klp500U/XaTWjcYlkszGbERZY+C4I/5XaQDyZvFS70WnJGCfkDu/rgcDYlhXhyhGFmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by SA1PR11MB5873.namprd11.prod.outlook.com
 (2603:10b6:806:228::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.6; Thu, 12 Mar
 2026 06:20:13 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::21ae:7048:11eb:3faa]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::21ae:7048:11eb:3faa%6]) with mapi id 15.20.9678.017; Thu, 12 Mar 2026
 06:20:12 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Liviu Dudau <liviu.dudau@arm.com>, Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
CC: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
	"kernel-list@raspberrypi.com" <kernel-list@raspberrypi.com>,
	"amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Murthy, Arun R"
	<arun.r.murthy@intel.com>, "Shankar, Uma" <uma.shankar@intel.com>, "Nikula,
 Jani" <jani.nikula@intel.com>, "harry.wentland@amd.com"
	<harry.wentland@amd.com>, "siqueira@igalia.com" <siqueira@igalia.com>,
	"alexander.deucher@amd.com" <alexander.deucher@amd.com>,
	"christian.koenig@amd.com" <christian.koenig@amd.com>, "airlied@gmail.com"
	<airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>,
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
	"mripard@kernel.org" <mripard@kernel.org>, "robin.clark@oss.qualcomm.com"
	<robin.clark@oss.qualcomm.com>, "abhinav.kumar@linux.dev"
	<abhinav.kumar@linux.dev>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
	"jessica.zhang@oss.qualcomm.com" <jessica.zhang@oss.qualcomm.com>,
	"sean@poorly.run" <sean@poorly.run>, "marijn.suijten@somainline.org"
	<marijn.suijten@somainline.org>, "laurent.pinchart+renesas@ideasonboard.com"
	<laurent.pinchart+renesas@ideasonboard.com>, "mcanal@igalia.com"
	<mcanal@igalia.com>, "dave.stevenson@raspberrypi.com"
	<dave.stevenson@raspberrypi.com>, "tomi.valkeinen+renesas@ideasonboard.com"
	<tomi.valkeinen+renesas@ideasonboard.com>,
	"kieran.bingham+renesas@ideasonboard.com"
	<kieran.bingham+renesas@ideasonboard.com>, "louis.chauvet@bootlin.com"
	<louis.chauvet@bootlin.com>
Subject: RE: [PATCH v2 1/7] drm: writeback: Refactor drm_writeback_connector
 structure
Thread-Topic: [PATCH v2 1/7] drm: writeback: Refactor drm_writeback_connector
 structure
Thread-Index: AQHcN02vT85paMQB00aFK032WJKPYrThNn0AgADtA3CAAJXhAIAAsTyAgAJA6gCAxbX74A==
Date: Thu, 12 Mar 2026 06:20:12 +0000
Message-ID: <DM3PPF208195D8D7481B8AA976112BD2AB6E344A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20251007054528.2900905-1-suraj.kandpal@intel.com>
 <20251007054528.2900905-2-suraj.kandpal@intel.com>
 <aQjDejhzGRYJT614@e110455-lin.cambridge.arm.com>
 <DM3PPF208195D8D5DDD56AA88E006E66AD9E3C4A@DM3PPF208195D8D.namprd11.prod.outlook.com>
 <aQoIBroBqQc3B-RD@e110455-lin.cambridge.arm.com>
 <CAO9ioeX2qEyjwi9LsnUh-cRv88iaRcdZtFr_yidf55A9_ZbLWw@mail.gmail.com>
 <aQyApokLttxf9spU@e110455-lin.cambridge.arm.com>
In-Reply-To: <aQyApokLttxf9spU@e110455-lin.cambridge.arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|SA1PR11MB5873:EE_
x-ms-office365-filtering-correlation-id: 455330f7-6b85-49a3-8754-08de7fff6b70
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info: VRZm4x86mJkI3i71l92w33OT3aspR9MumWPXtzdtlmnrYblhpi9QUMpkit8f/QzhiVqAkxIA/7NOPh0YAxF5rx0XujMjSwIv+RLmN8WUHM7lAS6TMjb6hOaFAYOfxN4JpQHk2p0E1yj2ZsAHKI1Iu6KOTy2AeMVrNRYHnayIm2a9eTIs1d47BPcgvBkaf2pF7do11w4SuQdA8/llsmJ971sTaZiJBsnIuw4q+nv2U62KFl7MBbKzVKCjGaalRrfo7U9emWimJsn8VWT/gnKJ8BuxZjJ9K7nT9/6ivLsDyqPowZ+MDgFnO56afoyro07uG1VckkNmZ/ERD9wmawcIJzhso5v8TWCniGMbijWcgloCzhTuEk/Y6kABZuWqDc+fOH9K3Sv9me5S6gQRIBuimuYCH3gYc7GGtOcNjVRDzg2IuP+xf/Zhdpq3Yw5nZLyg3+P8atOlPYUPBMYO5PMtx3d6L5LN56bDUqWEWDkT4lh6l5cEhopB48ExpqXxc3ZnlR5BolS3xoTAPfAiAWeGp6N9f2+bTg+eMFFjZmHhYzgwRYPOdv96RwvgTtQF1JJsEhlJJlHnng7r0UMcRk5hQwFqlHuL40Xjy0MFesmWBEcmtKMErlFStQRLdJmF8TZA24PSKgud/5t1qBtq6fTp5JvN+JoWDLfpl8yTgC7vRJ7nkCf4g9vUQ9Qkbr3yYQjvE14scP/7f7IPy6UCnGseTgSz77xaLH9qIqpkcVFrRxh6F4B9GYvmgVL7aPx7OnsGuEhyed67OEsUucmIKypW5CUzXxWNLDflreo1pwg/vGY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PPF208195D8D.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RFRBaXFGWTc4VXNjT0dJZDFKMGNLUnovTUNFK29wZGdsTTIrN2lWcDFmSHJX?=
 =?utf-8?B?QXYybXpMcWFPRkFRYW1teUUweHBkajAzTmRyWkNvbm42WjQ5anQvREx5TDBU?=
 =?utf-8?B?Z0ZCS0xUczhnMktldThsOEVFOHJydUNPTVVTTjFjZW5DblgzM1lOQTJMQlMw?=
 =?utf-8?B?OGpOcG0wOXliaWdITUZudm95bVhoVzV4cDdDUWxTakxaNmx3QUtHY3NqUld3?=
 =?utf-8?B?Q2dUTS9ZM0l6WjN0TStLR2NKcTZtaG1meVQyUnNOWCs4SGFveEYvWWhZcXM5?=
 =?utf-8?B?MVhCcUI1OFdvVGZObU01YVZFSHB6SmZFTlZCcDVIMHUybXFTT3NWNGNBaXFh?=
 =?utf-8?B?M3NMS3BKbzZmeWdzM01nNHZVdjIrYlhtaGF2WTNFYkMvb3NxWmJhOUl2aXZQ?=
 =?utf-8?B?YzVUakJvSk9Lc3FSMHdjNGlKZmFERkpFTjUxWjQwVGN3cWF4VzMycUp0ODhB?=
 =?utf-8?B?ck91UC9CR3NSTDF4TnNOQmZEdFdTY280dFpvRk16cmFTYlFvais5bVlKWGdO?=
 =?utf-8?B?TWhPenJWU2x4MHoyMldNVW90VHRYdXlHdmtYYnlxSW5MMEp0a3hwWkFzblFk?=
 =?utf-8?B?OGIybEU3dllYb0drQ253ZUV6a1ZoaXYwYXFkUGpndUo5dEtKUWVQSEVmMG5y?=
 =?utf-8?B?b3V4U0QzMDBlT3FXalV0WmdIYnlRZDdINW9reVhTKyt6YmV5RFkwMjJpbi8y?=
 =?utf-8?B?QlR2bkhxMS9UeGtsUllaN2puUGFvZzV5ckhjYnovcHM2RnRUQmVuR2M5b0ZG?=
 =?utf-8?B?SmxjckhoaGtRNnBoYlk5OFU1TUZlaTlwVWhZVC83cmVSWndxb0VnN1c3VXJi?=
 =?utf-8?B?U1NzdGFZS3ZOeE5HM0duSkpuNWxadVFBazU3UE0rd0Z1N2tTeGNQUnpzQUJa?=
 =?utf-8?B?VEc5c0d0KzVmOEViUlZuQ05meWxaLzVHeWFLUzd4blVlSTl4Ny82MklPOGow?=
 =?utf-8?B?djY2ZmVaeER3MVAwK1ROSkFaZ1o1MDB2OGRhSHRxVlJ2RC9SUW12cFhNUEww?=
 =?utf-8?B?bERCOFg5RWYxcDRzK3RVY1d2RkhlM0pnR1JQcVBzRE9GK2pDVXNGYU04RGxx?=
 =?utf-8?B?WHhGQzl2aXF6MGUvcDBiTFExckNENFg1MFF5Q3QwYmRKU1MwUVVCczFsdEw0?=
 =?utf-8?B?TUZDemxLNnJoUHVIc3RUL1M2dEUvaGZ5bVlaOHc0WW5QQ1JDbkFFQXRYaUNK?=
 =?utf-8?B?eVM0YXlnWGxacndHRnVyT0lYWCt0WWVTYzd5YjBNbzJxb1R3RkNrblN6d1ZU?=
 =?utf-8?B?YmNjMzFBc0F1QXVpbnlJQlI1akZ4TzNZaTd2TlBjTE1NSGJ2ekk4K0dhUzlL?=
 =?utf-8?B?ZzhtYzBBTXNJNXovemNydG9wbjdCZ0lFYWtPRWo1YmFMVmxXbUFRY091MDhW?=
 =?utf-8?B?MDEvYlFObkJPRHVVTEtNNjhrRk0wRlhubFdINFJPRW5wdFpSbWtPa0VTbnlr?=
 =?utf-8?B?UDVJYVN6aWZPZGtoUHhkYTRaTnlqcmtUeXltU2tWK09NOEYwd0FLeW9iWWVw?=
 =?utf-8?B?a0hLd0JWMWRxcUtHbTY4Sm1GYXJnZTg0Nlo5WkRvd0ZXODFLd2pWY2lpSzd3?=
 =?utf-8?B?elExbk1xY21QeENtVXg1V0FLTmZ6UTB5RzFZampaQTJkckxxaTI0b0NVVDIz?=
 =?utf-8?B?OGM4TXZhUDR4SlNGNit3a3BWcTVJZS85ZHBlR2g1VHIzTnl3enFGQ1VqTmRq?=
 =?utf-8?B?RFJ4bEZ4ZWVBU0kvRCtMNEFhTjEydm5Ud2RTQzNnU0Yra0xSUFZNdU0rMktQ?=
 =?utf-8?B?b2xKcUNRbnBjeVZuK0VhaFlQZHg3UHdiRmJZVERPdk5SZDdOTmhHMW10SUJ6?=
 =?utf-8?B?KzJhRjFKWVlqYWlPZ2hNWVpvWG9YYnlUbjRHenIvZXYrMG1Tc1F1N092bnRJ?=
 =?utf-8?B?SXp0ZGUydEN0OEk2MUp6UkxTWWtiL2xmWEsyRDZqb3pXK3VSNmJvMFlITXNk?=
 =?utf-8?B?b3NGRWkyUTdsRy9nY0hlQ3ovUDF2a0k0OGVhOEFISTBreHg2U1J4QmF1OGJ1?=
 =?utf-8?B?SXlMeDBGN1N4enh3Ry81Y2hYV25rV0k5OUFmcXpxRUoyWTVmNGFOTlpLMG55?=
 =?utf-8?B?SW9aVGxiSkh6Y1ZNU3RoRUc2a2c5ZFAzc0M0UUZ3REh5NnBVK3pIWTlCUy9k?=
 =?utf-8?B?Wm4relNicE93VlVoaVptMUVRandIem5OSXkxbEVxaEt0MXJBZFNuNkVCVHRM?=
 =?utf-8?B?aHNadmZLQXZ5VkZjVTlMVTh3VkVEaVRFaDlhRnZXeHJ1Q3FhTHZyWDh6MjlZ?=
 =?utf-8?B?SEZrVzUyVS9IL0tKQUVFT0l3RFNIdjZkUDZ4M2s0amdzeVF5SUIxOEJ5ekpQ?=
 =?utf-8?B?UjAyaFRpYlFaTDJYd1N6ZzhCMVg5YkE3dHZYRzFBT0plY3Uyb0podz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: a9SO+5bHXQB5wvfh8UTyYzcNeMVynSR9a2xljNqXivMiRWbsupczNplnBztlzwtk/+obnOFtdU8IY7hmzf239pEkoaSWVwZ/y37tAAEAg1dkbE1ucBDvyQE5dVsafNyviRhrwHI0n446KCW8cjn+g+bQoZ/9B1WJoIDuctUr+k+o+bVD959X+TdwL6CMTjHtMNVAfvmcIc0P603kNl0jjAOYxZpyM81TW9AQu9VNhm46xJzsW9VgjKPRZFSfA/jslk6R+2Hx5O3FvcqjX4KN070A4bdxcj+vScLu9Cx0yIRHwxh3eyRIEFAhjJFElTydUsyUsG3qb74pgWuwEL+p1g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 455330f7-6b85-49a3-8754-08de7fff6b70
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2026 06:20:12.8881
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: saqSHedKDYGHvGI96OEk+1Caazh2uglt4/7KFKd5sajLaOL7wZFjO6GNjAXqAstCCGwTHXBEpjKu8pQecNMllA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5873
X-OriginatorOrg: intel.com
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[35];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-29260-lists,linux-renesas-soc=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,raspberrypi.com,intel.com,amd.com,igalia.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,oss.qualcomm.com,linux.dev,suse.de,poorly.run,somainline.org,ideasonboard.com,bootlin.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,intel.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[suraj.kandpal@intel.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 2DAFD26D963
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDEvN10gZHJtOiB3cml0ZWJhY2s6IFJlZmFjdG9yIGRy
bV93cml0ZWJhY2tfY29ubmVjdG9yDQo+IHN0cnVjdHVyZQ0KPiANCj4gT24gV2VkLCBOb3YgMDUs
IDIwMjUgYXQgMDI6Mzk6MTVBTSArMDIwMCwgRG1pdHJ5IEJhcnlzaGtvdiB3cm90ZToNCj4gPiBP
biBUdWUsIDQgTm92IDIwMjUgYXQgMTY6MDUsIExpdml1IER1ZGF1IDxsaXZpdS5kdWRhdUBhcm0u
Y29tPiB3cm90ZToNCj4gPiA+DQo+ID4gPiBPbiBUdWUsIE5vdiAwNCwgMjAyNSBhdCAwNToxMToy
NUFNICswMDAwLCBLYW5kcGFsLCBTdXJhaiB3cm90ZToNCj4gPiA+ID4gPiBTdWJqZWN0OiBSZTog
W1BBVENIIHYyIDEvN10gZHJtOiB3cml0ZWJhY2s6IFJlZmFjdG9yDQo+ID4gPiA+ID4gZHJtX3dy
aXRlYmFja19jb25uZWN0b3Igc3RydWN0dXJlDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBPbiBUdWUs
IE9jdCAwNywgMjAyNSBhdCAxMToxNToyM0FNICswNTMwLCBTdXJhaiBLYW5kcGFsIHdyb3RlOg0K
PiA+ID4gPiA+ID4gU29tZSBkcml2ZXJzIGNhbm5vdCB3b3JrIHdpdGggdGhlIGN1cnJlbnQgZGVz
aWduIHdoZXJlIHRoZQ0KPiA+ID4gPiA+ID4gY29ubmVjdG9yIGlzIGVtYmVkZGVkIHdpdGhpbiB0
aGUgZHJtX3dyaXRlYmFja19jb25uZWN0b3Igc3VjaA0KPiA+ID4gPiA+ID4gYXMgSW50ZWwgYW5k
IHNvbWUgZHJpdmVycyB0aGF0IGNhbiBnZXQgaXQgd29ya2luZyBlbmQgdXANCj4gPiA+ID4gPiA+
IGFkZGluZyBhIGxvdCBvZiBjaGVja3MgYWxsIGFyb3VuZCB0aGUgY29kZSB0byBjaGVjayBpZiBp
dCdzIGENCj4gPiA+ID4gPiA+IHdyaXRlYmFjayBjb25lbmN0b3Igb3Igbm90LCB0aGlzIGlzIGR1
ZSB0byB0aGUgbGltaXRhdGlvbiBvZiBpbmhlcml0YW5jZQ0KPiBpbiBDLg0KPiA+ID4gPiA+ID4g
VG8gc29sdmUgdGhpcyBtb3ZlIHRoZSBkcm1fd3JpdGViYWNrX2Nvbm5lY3RvciB3aXRoaW4gdGhl
DQo+ID4gPiA+ID4gPiBkcm1fY29ubmVjdG9yIGFuZCByZW1vdmUgdGhlIGRybV9jb25uZWN0b3Ig
YmFzZSB3aGljaCB3YXMgaW4NCj4gPiA+ID4gPiA+IGRybV93cml0ZWJhY2tfY29ubmVjdG9yLiBN
YWtlIHRoaXMgZHJtX3dyaXRlYmFja19jb25uZWN0b3IgYQ0KPiA+ID4gPiA+ID4gdW5pb24gd2l0
aCBoZG1pIGNvbm5lY3RvciB0byBzYXZlIG1lbW9yeSBhbmQgc2luY2UgYSBjb25uZWN0b3INCj4g
PiA+ID4gPiA+IGNhbiBuZXZlciBiZSBib3RoIHdyaXRlYmFjayBhbmQgaGRtaSBpdCBzaG91bGQg
c2VydmUgdXMgd2VsbC4NCj4gPiA+ID4gPiA+IERvIGFsbCBvdGhlciByZXF1aXJlZCBtb2RpZmlj
YXRpb25zIHRoYXQgY29tZSB3aXRoIHRoZXNlDQo+ID4gPiA+ID4gPiBjaGFuZ2VzIGFsb25nIHdp
dGggYWRkaXRpb24gb2YgbmV3IGZ1bmN0aW9uIHdoaWNoIHJldHVybnMgdGhlDQo+ID4gPiA+ID4g
PiBkcm1fY29ubmVjdG9yIHdoZW4gZHJtX3dyaXRlYmFja19jb25uZWN0b3IgaXMgcHJlc2VudC4N
Cj4gPiA+ID4gPiA+IE1vZGlmeSBkcml2ZXJzIHVzaW5nIHRoZSBkcm1fd3JpdGViYWNrX2Nvbm5l
Y3RvciB0byBhbGxvdyB0aGVtDQo+ID4gPiA+ID4gPiB0byB1c2UgdGhpcyBjb25uZWN0b3Igd2l0
aG91dCBicmVha2luZyB0aGVtLg0KPiA+ID4gPiA+ID4gVGhlIGRyaXZlcnMgbW9kaWZpZWQgaGVy
ZSBhcmUgYW1kLCBrb21lZGEsIG1hbGksIHZjNCwgdmttcywNCj4gPiA+ID4gPiA+IHJjYXJfZHUs
IG1zbQ0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFN1cmFqIEthbmRw
YWwgPHN1cmFqLmthbmRwYWxAaW50ZWwuY29tPg0KPiA+ID4gPiA+ID4gLS0tDQo+ID4gPiA+ID4g
PiBWMSAtPiBWMjogVXNlICZjb25uZWN0b3ItPndyaXRlYmFjaywgbWFrZSBjb21taXQgbWVzc2Fn
ZQ0KPiA+ID4gPiA+ID4gaW1wZXJhdGl2ZQ0KPiA+ID4gPiA+ID4gKERtaXRyeSkNCj4gPiA+ID4g
PiA+IC0tLQ0KPiA+ID4gPiA+ID4gIC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9h
bWRncHVfZG0uYyB8ICA2ICstDQo+ID4gPiA+ID4gPiAuLi4vZ3B1L2RybS9hbWQvZGlzcGxheS9h
bWRncHVfZG0vYW1kZ3B1X2RtLmggfCAgMiArLQ0KPiA+ID4gPiA+ID4gLi4uL2RybS9hbWQvZGlz
cGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX3diLmMgIHwgIDggKy0tDQo+ID4gPiA+ID4gPiAuLi4v
Z3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMuYyAgfCAgNiArLQ0KPiA+ID4g
PiA+ID4gIC4uLi9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmggICB8ICA2
ICstDQo+ID4gPiA+ID4gPiAgLi4uL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfd2JfY29ubmVj
dG9yLmMgIHwgIDggKy0tDQo+ID4gPiA+ID4gPiAgZHJpdmVycy9ncHUvZHJtL2FybS9tYWxpZHBf
Y3J0Yy5jICAgICAgICAgICAgIHwgIDIgKy0NCj4gPiA+ID4gPiA+ICBkcml2ZXJzL2dwdS9kcm0v
YXJtL21hbGlkcF9kcnYuaCAgICAgICAgICAgICAgfCAgMiArLQ0KPiA+ID4gPiA+ID4gIGRyaXZl
cnMvZ3B1L2RybS9hcm0vbWFsaWRwX2h3LmMgICAgICAgICAgICAgICB8ICA2ICstDQo+ID4gPiA+
ID4gPiAgZHJpdmVycy9ncHUvZHJtL2FybS9tYWxpZHBfbXcuYyAgICAgICAgICAgICAgIHwgIDgg
Ky0tDQo+ID4gPiA+ID4gPiAgZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNfdWFwaS5jICAgICAg
ICAgICAgIHwgIDIgKy0NCj4gPiA+ID4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX3dyaXRlYmFj
ay5jICAgICAgICAgICAgICAgfCAzNSArKysrKystLS0tDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBG
b3IgdGhlIGtvbWVkYSBhbmQgbWFsaWRwIGRyaXZlcnMsIGFzIHdlbGwgYXMgZm9yIHRoZQ0KPiA+
ID4gPiA+IGRybV93cml0ZWJhY2suYw0KPiA+ID4gPiA+IGNoYW5nZXM6DQo+ID4gPiA+ID4NCj4g
PiA+ID4gPiBSZXZpZXdlZC1ieTogTGl2aXUgRHVkYXUgPGxpdml1LmR1ZGF1QGFybS5jb20+DQo+
ID4gPiA+ID4NCg0KSGkgTGl2aXUsDQpJIGFtIHBsYW5uaW5nIHRvIHJlZnJlc2ggdGhpcyBzZXJp
ZXMuDQpDYW4gSSB0YWtlIHRoaXMgUmIgZm9yIHRoZSB3aG9sZSBzZXJpZXMgb3IganVzdCB0aGlz
IHBhdGNoLg0KDQpSZWdhcmRzLA0KU3VyYWogS2FuZHBhbA0KDQo+ID4gPiA+ID4NCj4gPiA+ID4g
PiBbc25pcF0NCj4gPiA+ID4gPg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEv
aW5jbHVkZS9kcm0vZHJtX2Nvbm5lY3Rvci5oDQo+ID4gPiA+ID4gPiBiL2luY2x1ZGUvZHJtL2Ry
bV9jb25uZWN0b3IuaCBpbmRleCA4ZjM0ZjRiODE4M2QuLjFiMDkwZTZiZGRjMQ0KPiA+ID4gPiA+
ID4gMTAwNjQ0DQo+ID4gPiA+ID4gPiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fY29ubmVjdG9yLmgN
Cj4gPiA+ID4gPiA+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9jb25uZWN0b3IuaA0KPiA+ID4gPiA+
ID4gQEAgLTE4ODIsNiArMTg4Miw2MSBAQCBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9jZWMgew0KPiA+
ID4gPiA+ID4gICB2b2lkICpkYXRhOw0KPiA+ID4gPiA+ID4gIH07DQo+ID4gPiA+ID4gPg0KPiA+
ID4gPiA+ID4gKy8qKg0KPiA+ID4gPiA+ID4gKyAqIHN0cnVjdCBkcm1fd3JpdGViYWNrX2Nvbm5l
Y3RvciAtIERSTSB3cml0ZWJhY2sgY29ubmVjdG9yDQo+ID4gPiA+ID4gPiArKi8gc3RydWN0IGRy
bV93cml0ZWJhY2tfY29ubmVjdG9yIHsNCj4gPiA+ID4gPiA+ICsgLyoqDQo+ID4gPiA+ID4gPiAr
ICAqIEBwaXhlbF9mb3JtYXRzX2Jsb2JfcHRyOg0KPiA+ID4gPiA+ID4gKyAgKg0KPiA+ID4gPiA+
ID4gKyAgKiBEUk0gYmxvYiBwcm9wZXJ0eSBkYXRhIGZvciB0aGUgcGl4ZWwgZm9ybWF0cyBsaXN0
IG9uDQo+ID4gPiA+ID4gPiArd3JpdGViYWNrDQo+ID4gPiA+ID4gPiArICAqIGNvbm5lY3RvcnMN
Cj4gPiA+ID4gPiA+ICsgICogU2VlIGFsc28gZHJtX3dyaXRlYmFja19jb25uZWN0b3JfaW5pdCgp
DQo+ID4gPiA+ID4gPiArICAqLw0KPiA+ID4gPiA+ID4gKyBzdHJ1Y3QgZHJtX3Byb3BlcnR5X2Js
b2IgKnBpeGVsX2Zvcm1hdHNfYmxvYl9wdHI7DQo+ID4gPiA+ID4gPiArDQo+ID4gPiA+ID4gPiAr
IC8qKiBAam9iX2xvY2s6IFByb3RlY3RzIGpvYl9xdWV1ZSAqLyBzcGlubG9ja190IGpvYl9sb2Nr
Ow0KPiA+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ID4gKyAvKioNCj4gPiA+ID4gPiA+ICsgICogQGpv
Yl9xdWV1ZToNCj4gPiA+ID4gPiA+ICsgICoNCj4gPiA+ID4gPiA+ICsgICogSG9sZHMgYSBsaXN0
IG9mIGEgY29ubmVjdG9yJ3Mgd3JpdGViYWNrIGpvYnM7IHRoZSBsYXN0DQo+ID4gPiA+ID4gPiAr
IGl0ZW0gaXMgdGhlDQo+ID4gPiA+ID4gPiArICAqIG1vc3QgcmVjZW50LiBUaGUgZmlyc3QgaXRl
bSBtYXkgYmUgZWl0aGVyIHdhaXRpbmcgZm9yIHRoZQ0KPiA+ID4gPiA+ID4gKyBoYXJkd2FyZQ0K
PiA+ID4gPiA+ID4gKyAgKiB0byBiZWdpbiB3cml0aW5nLCBvciBjdXJyZW50bHkgYmVpbmcgd3Jp
dHRlbi4NCj4gPiA+ID4gPiA+ICsgICoNCj4gPiA+ID4gPiA+ICsgICogU2VlIGFsc286IGRybV93
cml0ZWJhY2tfcXVldWVfam9iKCkgYW5kDQo+ID4gPiA+ID4gPiArICAqIGRybV93cml0ZWJhY2tf
c2lnbmFsX2NvbXBsZXRpb24oKSAgKi8gc3RydWN0IGxpc3RfaGVhZA0KPiA+ID4gPiA+ID4gKyBq
b2JfcXVldWU7DQo+ID4gPiA+ID4gPiArDQo+ID4gPiA+ID4gPiArIC8qKg0KPiA+ID4gPiA+ID4g
KyAgKiBAZmVuY2VfY29udGV4dDoNCj4gPiA+ID4gPiA+ICsgICoNCj4gPiA+ID4gPiA+ICsgICog
dGltZWxpbmUgY29udGV4dCB1c2VkIGZvciBmZW5jZSBvcGVyYXRpb25zLg0KPiA+ID4gPiA+ID4g
KyAgKi8NCj4gPiA+ID4gPiA+ICsgdW5zaWduZWQgaW50IGZlbmNlX2NvbnRleHQ7DQo+ID4gPiA+
ID4gPiArIC8qKg0KPiA+ID4gPiA+ID4gKyAgKiBAZmVuY2VfbG9jazoNCj4gPiA+ID4gPiA+ICsg
ICoNCj4gPiA+ID4gPiA+ICsgICogc3BpbmxvY2sgdG8gcHJvdGVjdCB0aGUgZmVuY2VzIGluIHRo
ZSBmZW5jZV9jb250ZXh0Lg0KPiA+ID4gPiA+ID4gKyAgKi8NCj4gPiA+ID4gPiA+ICsgc3Bpbmxv
Y2tfdCBmZW5jZV9sb2NrOw0KPiA+ID4gPiA+ID4gKyAvKioNCj4gPiA+ID4gPiA+ICsgICogQGZl
bmNlX3NlcW5vOg0KPiA+ID4gPiA+ID4gKyAgKg0KPiA+ID4gPiA+ID4gKyAgKiBTZXFubyB2YXJp
YWJsZSB1c2VkIGFzIG1vbm90b25pYyBjb3VudGVyIGZvciB0aGUgZmVuY2VzDQo+ID4gPiA+ID4g
PiArICAqIGNyZWF0ZWQgb24gdGhlIGNvbm5lY3RvcidzIHRpbWVsaW5lLg0KPiA+ID4gPiA+ID4g
KyAgKi8NCj4gPiA+ID4gPiA+ICsgdW5zaWduZWQgbG9uZyBmZW5jZV9zZXFubzsNCj4gPiA+ID4g
PiA+ICsgLyoqDQo+ID4gPiA+ID4gPiArICAqIEB0aW1lbGluZV9uYW1lOg0KPiA+ID4gPiA+ID4g
KyAgKg0KPiA+ID4gPiA+ID4gKyAgKiBUaGUgbmFtZSBvZiB0aGUgY29ubmVjdG9yJ3MgZmVuY2Ug
dGltZWxpbmUuDQo+ID4gPiA+ID4gPiArICAqLw0KPiA+ID4gPiA+ID4gKyBjaGFyIHRpbWVsaW5l
X25hbWVbMzJdOw0KPiA+ID4gPiA+ID4gK307DQo+ID4gPiA+ID4gPiArDQo+ID4gPiA+ID4gPiAg
LyoqDQo+ID4gPiA+ID4gPiAgICogc3RydWN0IGRybV9jb25uZWN0b3IgLSBjZW50cmFsIERSTSBj
b25uZWN0b3IgY29udHJvbCBzdHJ1Y3R1cmUNCj4gPiA+ID4gPiA+ICAgKg0KPiA+ID4gPiA+ID4g
QEAgLTIyOTEsMTAgKzIzNDYsMTYgQEAgc3RydWN0IGRybV9jb25uZWN0b3Igew0KPiA+ID4gPiA+
ID4gICAgKi8NCj4gPiA+ID4gPiA+ICAgc3RydWN0IGxsaXN0X25vZGUgZnJlZV9ub2RlOw0KPiA+
ID4gPiA+ID4NCj4gPiA+ID4gPiA+IC0gLyoqDQo+ID4gPiA+ID4gPiAtICAqIEBoZG1pOiBIRE1J
LXJlbGF0ZWQgdmFyaWFibGUgYW5kIHByb3BlcnRpZXMuDQo+ID4gPiA+ID4gPiAtICAqLw0KPiA+
ID4gPiA+ID4gLSBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9oZG1pIGhkbWk7DQo+ID4gPiA+ID4gPiAr
IHVuaW9uIHsNCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFRoaXMgaXMgYSBzdXJwcmlzaW5nIGNob2lj
ZS4gQmVmb3JlIHRoaXMgcGF0Y2ggb25lIGhhZCB0byBoYXZlIGENCj4gPiA+ID4gPiBzZXBhcmF0
ZSB3cml0ZWJhY2sgY29ubmVjdG9yIGJlc2lkZXMgdGhlIEhETUkgY29ubmVjdG9yLiBHb2luZw0K
PiA+ID4gPiA+IGZvcndhcmQgaXQgbG9va3MgbGlrZSB5b3Ugc3RpbGwgbmVlZCB0d28gY29ubmVj
dG9ycywgb25lIHRoYXQNCj4gPiA+ID4gPiB1c2VzIHRoZSB3cml0ZWJhY2sgbWVtYmVyIGFuZCBv
bmUgdGhhdCB1c2VzIHRoZSBoZG1pIG9uZS4gSXMgdGhhdA0KPiBpbnRlbmRlZD8NCj4gPiA+ID4g
Pg0KPiA+ID4gPiA+IEkgd2FzIGV4cGVjdGluZyB0aGF0IHlvdSdyZSBnb2luZyB0byBkZWNsYXJl
IHRoZSB3cml0ZWJhY2sNCj4gPiA+ID4gPiBtZW1iZXIgbmV4dCB0byB0aGUgaGRtaSwgd2l0aG91
dCBvdmVybGFwLiBJZiB5b3UgZG8gdGhhdCwgdGhlbg0KPiA+ID4gPiA+IHlvdSBhbHNvIGRvbid0
IG5lZWQgdG8gbW92ZSB0aGUgc3RydWN0IGRybV93cml0ZWJhY2sgZGVjbGFyYXRpb24NCj4gPiA+
ID4gPiBmcm9tIHRoZSBoZWFkZXIgZmlsZSBhbmQgaXQgc2hvdWxkIGJlIGVub3VnaCB0byBpbmNs
dWRlIHRoZQ0KPiBkcm1fd3JpdGViYWNrLmggZmlsZS4NCj4gPiA+ID4NCj4gPiA+ID4gSGksDQo+
ID4gPiA+IFRoYW5rcyBmb3IgdGhlIHJldmlldw0KPiA+ID4gPiBUaGUgcmVhc29uIGZvciB0aGlz
IGNhbWUgZnJvbSB0aGUgZGlzY3Vzc2lvbiBvbiBwcmV2aW91cyBwYXRjaGVzIGFuZCB3YXMNCj4g
c3VnZ2VzdGVkIGJ5IERtaXRyeS4NCj4gPiA+ID4gVGhlIGlkZWEgaXMgdGhhdCBhIGNvbm5lY3Rv
ciBjYW4gbmV2ZXIgYmUgYm90aCBhbiBIRE1JIGFuZA0KPiA+ID4gPiB3cml0ZWJhY2sgY29ubmVj
dG9yIGF0IHRoZSBzYW1lIHRpbWUgSGVuY2Ugd2Ugc2F2ZSBzcGFjZSBpZiB3ZSBwYWNrDQo+IHRo
ZW0gdG9nZXRoZXIuDQo+ID4gPg0KPiA+ID4gSG1tLCBidXQgeW91IGNhbiBzdGlsbCBoYXZlIGFs
bCB0aGUgQ0VDIGFuZCBIRE1JIGNvZGVjcyBkYXRhIGluIHRoYXQNCj4gPiA+IGNvbm5lY3Rvciwg
d2hpY2ggZmVlbHMgc3RyYW5nZS4gIEFsc28sIHdoYXQncyB0aGUgaXNzdWUgd2l0aCBoYXZpbmcN
Cj4gPiA+IGEgY29ubmVjdG9yIHRoYXQgaGFzIGJvdGggYSB2YWxpZCBIRE1JIHN0YXRlIGFuZCBh
biBhc3NvY2lhdGVkIHdyaXRlYmFjayBhdA0KPiB0aGUgc2FtZSB0aW1lIChpLmUuDQo+ID4gPiBk
b24ndCB1c2UgdGhlIHVuaW9uKT8gV3JpdGluZyBiYWNrIHRoZSBtZW1vcnkgdGhlIG91dHB1dCB0
aGF0IGdvZXMNCj4gPiA+IHRvIEhETUkgaXMgdmFsaWQsIHJpZ2h0Pw0KPiA+DQo+ID4gV3JpdGlu
ZyBiYWNrIHRvIG1lbW9yeSByZXF1aXJlcyBhIHNlcGFyYXRlIGNvbm5lY3RvciAod2l0aCBzZXBh
cmF0ZQ0KPiA+IHNldHVwKS4gVGhlIENSVEMgc2hvdWxkIGFsc28gc3VwcG9ydCBvdXRwdXR0aW5n
IGRhdGEgdG8gYm90aCBIRE1JDQo+ID4gX2FuZF8gV3JpdGViYWNrIGNvbm5lY3RvcnMgYXQgdGhl
IHNhbWUgdGltZSAoYWthIGNsb25pbmcpLiBOb3QgYWxsDQo+ID4gY29uZmlndXJhdGlvbnMgYXJl
IHBvc3NpYmxlLCB3cml0ZWJhY2sgcmVxdWlyZXMgYWRkaXRpb25hbCBiYW5kd2lkdGgsDQo+ID4g
ZXRjLiwgZXRjLg0KPiA+DQo+ID4gPg0KPiA+ID4gTWF5YmUgdGhhdCBpcyBub3Qgc29tZXRoaW5n
IHRoYXQgeW91IGNvbnNpZGVyZWQsIGJ1dCB3aXRoIHRoaXMgcGF0Y2gNCj4gPiA+ICh3aXRob3V0
IHVuaW9uKSB3ZSBjYW4gZHJvcCB0aGUgbmVlZCB0byBoYXZlIGEgc2VwYXJhdGUgY29ubmVjdG9y
DQo+ID4gPiBqdXN0IGZvciB3cml0ZWJhY2suIFdlJ3JlIGJyZWFraW5nIHVzZXIgc3BhY2UgY29t
cGF0aWJpbGl0eSwgdHJ1ZSwNCj4gPiA+IGJ1dCBpdCBmZWVscyBsaWtlIGEgZ29vZCBjaGFuZ2Ug
dG8gYmUgYWJsZSB0byBhdHRhY2ggYSB3cml0ZWJhY2sgdG8NCj4gPiA+IGFueSBjb25uZWN0b3Ig
YW5kIGdldCBpdHMgb3V0cHV0LiBUaGUgZHJpdmVycyB0aGF0IGRvbid0IHN1cHBvcnQgdGhhdCBj
YW4NCj4gcmVqZWN0IHRoZSBjb21taXQgdGhhdCBhdHRhY2hlcyB0aGUgd3JpdGViYWNrIHRvIHRo
ZSBleGlzdGluZyBjb25uZWN0b3IuDQo+ID4NCj4gPiBXZWxsLi4uIE5vLiBJdCdzIG5vdCBob3cg
aXQgaXMgYmVpbmcgaGFuZGxlZCBpbiB0aGUgKGV4aXN0aW5nKQ0KPiA+IGhhcmR3YXJlLiBOb3Ig
ZG9lcyBpdCBtYWtlIGl0IGVhc2llciB0byBoYW5kbGUgcmVzb3VyY2VzIGZvciB0aGUNCj4gPiB3
cml0ZWJhY2suDQo+IA0KPiBXaGljaCAoZXhpc3RpbmcpIGhhcmR3YXJlPyBLb21lZGEgY2FuIGRv
IGl0IG1haW5seSBiZWNhdXNlIGl0IGRvZXNuJ3QgaGF2ZSBhbg0KPiBIRE1JIGNvbm5lY3Rvciwg
YnV0IGFuIG91dHB1dCB0aGF0IGNhbiBiZSBjbG9uZWQgdG8gd3JpdGViYWNrIHdoaWxlIGl0IGlz
DQo+IGJlaW5nIHNlbnQgb3V0IG9uIGEgYnVzIHRvIGFuIGVuY29kZXIuDQo+IFlvdSBoYXZlIHRv
IHJlbWVtYmVyIHRoYXQgd3JpdGViYWNrIGlzIGEgY29ubmVjdG9yIGJlY2F1c2Ugd2UgZGlkbid0
IGhhdmUgYQ0KPiBiZXR0ZXIgY29uY2VwdCBmb3IgaXQuIEl0IGRvZXNuJ3QgaGF2ZSB0byBiZSBh
IHNlcGFyYXRlIGNvbm5lY3RvciBmcm9tIGFuIEhETUkNCj4gb3IgZURQIG9yIERQLg0KPiANCj4g
QmVzdCByZWdhcmRzLA0KPiBMaXZpdQ0KPiANCj4gPg0KPiA+IC0tDQo+ID4gV2l0aCBiZXN0IHdp
c2hlcw0KPiA+IERtaXRyeQ0KPiANCj4gLS0NCj4gPT09PT09PT09PT09PT09PT09PT0NCj4gfCBJ
IHdvdWxkIGxpa2UgdG8gfA0KPiB8IGZpeCB0aGUgd29ybGQsICB8DQo+IHwgYnV0IHRoZXkncmUg
bm90IHwNCj4gfCBnaXZpbmcgbWUgdGhlICAgfA0KPiAgXCBzb3VyY2UgY29kZSEgIC8NCj4gICAt
LS0tLS0tLS0tLS0tLS0NCj4gICAgIMKvXF8o44OEKV8vwq8NCg==

