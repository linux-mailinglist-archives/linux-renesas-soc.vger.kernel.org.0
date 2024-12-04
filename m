Return-Path: <linux-renesas-soc+bounces-10874-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D94559E304D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Dec 2024 01:19:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0E699B22320
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Dec 2024 00:19:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDDA610F9;
	Wed,  4 Dec 2024 00:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d6vFoK6W"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778A2624;
	Wed,  4 Dec 2024 00:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733271564; cv=fail; b=tG6wTet69HC5rOnztGaV+iJWHw/edGLaOoVaHY1GopdwummR8jr7J+K2oPRU2MOjt/TFqML34Mx+YdcWgfkrVeLcEgap0D8XSf9H9iR+1las9XrSzGpqpP7sjEBstcGKozCHDcuz7IvSka0wT2gu2Ga47yp6iAxweZGV3oPQ17Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733271564; c=relaxed/simple;
	bh=G14Dremjc3oaDr9oTlMQAJJNeQDeaNSvtBRG7CfjHOs=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=l4SkPn2JwzSq+ol07xStjahomfMkV7r6zTdYnB6AN5iDLryryEtJql16+nxAhHbYYa/PGqCaSdngy54npO/uxZQci767wnkmZHP1BWxv5jWsH1rZxNjZSViIHgheKz6e5aWvM6ryx5rQaPOT13+0oYTDu3odYYfUxd4PNqy9JJA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d6vFoK6W; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733271562; x=1764807562;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=G14Dremjc3oaDr9oTlMQAJJNeQDeaNSvtBRG7CfjHOs=;
  b=d6vFoK6WOoFpTB+3dlJpf+zsh5YsTqzSM8AjuRegTF3it7h86BFydIWX
   oNvdpwePpsfYr9+TXg3QlcCzeXra+jrFk3VvMbE+4d6lwCo0VKD8Vru7p
   vTFtP1FJeQN66+kC/vGWH8hzYUVdSxgn9AAseFFuU2oqhhWjcX8q+5nUK
   xYIPAHqi1yUIQ6Ln6ldXqzP6QD+VCefl5wYyhsteTJALtlNT13Zlym73B
   V6c39+4Jf7gaB7gx8w2SAwd6fUgczu+jJEoWr8UaAvB5RGvf7ALFyvW0+
   ypqKkGSSpFFCWavfVNO1foxvRPWoiXScSNwW5FIp1xYj3ZGSM5AdvIgxM
   Q==;
X-CSE-ConnectionGUID: C28az5DwQCCEgBetRKVFJQ==
X-CSE-MsgGUID: xAWRyiVOQM2M1ilzSBxEOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="37173757"
X-IronPort-AV: E=Sophos;i="6.12,206,1728975600"; 
   d="scan'208";a="37173757"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 16:19:21 -0800
X-CSE-ConnectionGUID: bLfeW7MrR3CPJNxA9v2NSg==
X-CSE-MsgGUID: 6j2dWhvjSIGwB6Iy/NqXrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,206,1728975600"; 
   d="scan'208";a="124424997"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 03 Dec 2024 16:19:21 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Dec 2024 16:19:18 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 3 Dec 2024 16:19:18 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 3 Dec 2024 16:19:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vCJ2kYChGe1b/olHO2lrawMgwdH+ZRBALXkKS3Wzt069wegKre3Otn1Gv5xgkw0vGvGlCq6Iga7j6OqNZlsPBMHUjQgqEMzfZfLJNsHzxBXKesb9IKj+IAdoZW+2U5L0g+crAv7sI19jKOP35J1es8dQKYhlaQjhyi+Eza0HcVNaRiqfpmQO8cCvq0jyF1BtwUqU21iAsXnU/g/Ql+XaK+DirN01QC3L7dbtIZGz8cRAJzwXx7bp0tZ0KneoQnslHDBxvBeqQuSJw//o0QXzx7cOAnJuNW0r+XEZ8JZuM//EHAaNup4Ep5UkBKWhCgSurARBfFCxtVy3C6h2AZjlrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u2/mXgdXz9eiTLjmhpLITjzUdJ1Utl3bJFROk0q7chU=;
 b=ycF7r7uiFPbyYrz9LRJ7fh94ZskeFp28nWf7i3rlaY6OPo2llEi18qTgexU4M8ryNeqsvnimsVgGCUvDOXbx/5J+NER7B1eayZ7I3iLg/wxycq+4F6sDovJ3wjOK8CjJ5y5VMkgjo+EiGBJSTHgBGr/PpFiRx7gdReF7Q/Fh+kbbaNUL1OVgRQEZfpcWTOlJU6KQmNamDwjaqIXypN/aO8j6Cn4ijKBwG6drQdPUx5wtkLQp3OhEPYFdkGqXZeQTKEdCEuzPOzOeNCkn2XLxLKvZokWudjCwt2+B81TmQS5BDJewRU9pHrFHCrlKCFyu7I7QpRRiMP8yKuQFQMbi+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5089.namprd11.prod.outlook.com (2603:10b6:303:9b::16)
 by CY8PR11MB7265.namprd11.prod.outlook.com (2603:10b6:930:98::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Wed, 4 Dec
 2024 00:19:10 +0000
Received: from CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::7de8:e1b1:a3b:b8a8]) by CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::7de8:e1b1:a3b:b8a8%4]) with mapi id 15.20.8207.017; Wed, 4 Dec 2024
 00:19:10 +0000
Message-ID: <2be4b535-3d66-4358-94b0-dff7daacff74@intel.com>
Date: Tue, 3 Dec 2024 16:18:58 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] net: renesas: rswitch: several fixes
To: Nikita Yushchenko <nikita.yoush@cogentembedded.com>, Yoshihiro Shimoda
	<yoshihiro.shimoda.uh@renesas.com>, Andrew Lunn <andrew@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "Geert
 Uytterhoeven" <geert+renesas@glider.be>
CC: <netdev@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Michael Dege <michael.dege@renesas.com>,
	Christian Mardmoeller <christian.mardmoeller@renesas.com>, Dennis Ostermann
	<dennis.ostermann@renesas.com>
References: <20241202134904.3882317-1-nikita.yoush@cogentembedded.com>
Content-Language: en-US
From: Jacob Keller <jacob.e.keller@intel.com>
In-Reply-To: <20241202134904.3882317-1-nikita.yoush@cogentembedded.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ2PR07CA0011.namprd07.prod.outlook.com
 (2603:10b6:a03:505::20) To CO1PR11MB5089.namprd11.prod.outlook.com
 (2603:10b6:303:9b::16)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5089:EE_|CY8PR11MB7265:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e6185c4-0128-4535-9b48-08dd13f945e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S3VwTEpIMWpmMUFKQ0g1MGMrdUplZHJxMldGVmttMjkrZDZvZFZGMXNtSThw?=
 =?utf-8?B?empPYVV2QXJRbVRDempNczh0MVJGU285VWIyaXJxZzZsQ2xFUTZHVVlBK0do?=
 =?utf-8?B?L2d1QVdrV3hFajRNSW1ZOWx5d1Q2V3d5SU8zckNjSXlqTkZoNXAxcitkK1VU?=
 =?utf-8?B?Zi9JVE5CeWFzWjhTb3NvdEN1dkgrc05vRmUzN203ZnlrRHFoVnI3RU1pbnp1?=
 =?utf-8?B?cWdMNU41NnI2c1kvZUI5RVhZdnluOE1XQTNUdzZreVJIcGdTMkUyNVdsV1RU?=
 =?utf-8?B?K00raWEvenZ5b1FkRS8vOWJmQ2xtaVFHSWZiS1JOcm1VUFBtL1hhL0lyTmRo?=
 =?utf-8?B?Zmlja0VmMWltWGQ1VjBiWmo5cFpCT01CbVZGdjI3VjRwZFhZcXhVWk1yYlJM?=
 =?utf-8?B?MFpSL1BZOVB4SlJpT1RxTytQbm5pWGtpeEx5YkpHeWRYc3R5MDBjQXI5Uncr?=
 =?utf-8?B?NW9RMEVyaHI3bzlXUmluU1k3MVl4eHBlNjhLYm1vMmZoaTBvM0I2RTkrU3VQ?=
 =?utf-8?B?dmQ1SnMyTDE1NVNua2o5V0gyaVJ4ZEhWMmViQTJqUVNMTG8zQTRTL1FRdyt2?=
 =?utf-8?B?c09aNjRMS25yMVBNMktVTkNFR1pRVmVrODQrSGkrc0VhRm13S0lxZHYwbUYx?=
 =?utf-8?B?MDNqNS9uME1HcDZieUxCTlE1dnJJM3hwU2cyQnZuSVZiUDVLNmpJVEI4b0Zi?=
 =?utf-8?B?Y1NOLzJmelZERzJmTVM0MG01YTZQT1p5cVdteTlUSGZvOHpYRHB6SmdIY2R6?=
 =?utf-8?B?ZmZDdUwvR0dNdzI2blQ3YlJOZW91eUlTRnBjZ0pVby9BYmV5aVh6emIyMUVo?=
 =?utf-8?B?TWVjY2VIaTdQbzR1SmYrZjNONmlnZVQrMU9rbE10bG5RS2ZhT3NQR3Z6VzA1?=
 =?utf-8?B?d1BKSlJJL0pQemNvaWVFVFh6cFRWU1FnMTdSUCtlVW81MjVnaEhKVHBlM3lM?=
 =?utf-8?B?YWg0bDR1Wm5HMlBiZ1hIQVRUejF0RTJyWFVrOTFPMmZnd3FBL3huNWc0R2M2?=
 =?utf-8?B?M1lVeHhWRGE4K3BlazkrazhCOVc0OFpXdm9iUzk0UVBpaDhkMVpKUVlhcjVJ?=
 =?utf-8?B?ZXB4VXpsNEVnVUtReXdKVm8yTHBZcmtKbDhKWkNLM1UvdmRYQmw0SDVBdndt?=
 =?utf-8?B?WDBjeHZ3OElZTXdMU05OaGlIMThhVlJsblRobFRlME5HVjc2cCs0am5HcnFZ?=
 =?utf-8?B?WXl6OENQSkVxMTNPTWJQUlV0Tk1nOTc4UXlnTi9rOVZVb055ZG5kT0c3UkxK?=
 =?utf-8?B?NUtlZWYzM3dLbHhXbi9TZm5LV3JSNFJDYlBNRFZobTBjakJNbUR4bHFmSjcv?=
 =?utf-8?B?TkpGZUl6TkNIaEpKQnU5MkNjQ3Bmem1sK3YzVSsvYmo3cHVDL1RCbzBDbmxZ?=
 =?utf-8?B?RkNPYnJDZWJSWE9qaWtCdTlSbzZFOThGaFRWTGp0dTVENzI1K1Z1TE9YUUJD?=
 =?utf-8?B?K1dIUDlLQjdmai8xVmZvMTNYYW8yU0Q0SVk4N1B1dGZmMFJNVG9rbWExaVpM?=
 =?utf-8?B?c3ZLWjdFUDdhejQ4akF5M2hLc2lKQVJrREJSMU5Pci9DNTBqZWNmS3MxblYv?=
 =?utf-8?B?NXZ5QnJhaFk3UnB6MzRjMndQL3B6ekVJZThMZWFYZEhSdkRjbzlVc2pqclIr?=
 =?utf-8?B?MUVNbDBiRklhOWRHMVNHVjUwV25GZEtsRmZCYTFkN2JGaHpyM1NRYktJRXJw?=
 =?utf-8?B?QUpPSTlXTUNXcnZkcWtkN0xnbEhGME5BMjAwazFGRzJLQ2U1VXBNWXNWMmkv?=
 =?utf-8?B?d1h5bWtMNjdSYlRJU09iZDJ5WjQ3RWw4M3dNRE5tbnZmcTFwcVJ4ZVpxSkJB?=
 =?utf-8?B?amUwcHF5QnRVLzN2YWlNUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5089.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHVHa1FVZmYrRnhKSlJBTDQ2RDQ2MUkzNmlUZjhuTUZ6MERkcXhENnRBSEpK?=
 =?utf-8?B?SGExNVRxaW9ONmYyZFQxZ2JKaSsyUDYwRGhGYzJSY1ljTlJrVzBMTlIvcFBO?=
 =?utf-8?B?dk9aUzg5QjZ4SFRJekFhQjBpV0NMdFU4N2hGaHhRNWJ3bFZwMXVtc3htN1ZI?=
 =?utf-8?B?R210TkJqazNhZDF2VFVpdFR5L2dGcUw0ajlSRU5NZzFuS3MxUkQwZnFWT3VB?=
 =?utf-8?B?dGZ5eFFiUmRIcXQzUC9UN3RtMldkT2VXL011Q20zZ252TWhMam9CeWk2dGVU?=
 =?utf-8?B?V2VwL3VwVHZ2Zjg1V2l4YitvcnBva3NTbmd3OWNRMlpqaGZHdklIaFJ3NnFG?=
 =?utf-8?B?a09UcSt4ZDZVMmlUSGRpanFJRlV3Q3hEMndzUlEySTdnQ0hJWnFVdW5hTTgx?=
 =?utf-8?B?Zm1yVVFMUUswWmZvd0xIejJiWUdVSEVuYll4eG1NQ2hlckNwcGkydVlkcENK?=
 =?utf-8?B?WUJyd3QzanpHM3ZxVGR3UncxQ09Cc1RLOFhNNW53amo5N3pVQm9TZlRsbHRi?=
 =?utf-8?B?WERyOVY2cjBTd3diMHJzeVQzeUNCT203b1JscEJ5eG5lMEFqbWpIL29tWmx3?=
 =?utf-8?B?d1hFbk9OVG91N2JvRjZUdTFPYS92cFhPZDBiMG9MdFJTWVZEdk9JVzdrblB3?=
 =?utf-8?B?Z3Y4c1UxN2xnNUtLczBMVnBQcndMM0UvZGMrVy9aMzdUY01IcFo4SWVEdm03?=
 =?utf-8?B?UHR3bVFnRVlNRW1PNzZ0M2lMQktxeVdIbGxzN1QzSmRCV1JaSTNwSzl4Y256?=
 =?utf-8?B?b2N2d1M1ak9QQVdRdDJkTzY4eEFGYnlqZndacUYyNFhEN2dkRVcvNnUrdDVL?=
 =?utf-8?B?QW1DSWJ6RGlMenpIY3dLQnVSakFPRjQzRHpxUlVTdE04RDFHdmlwRktqNHVo?=
 =?utf-8?B?UmJRY2hFcEMzK0lORGc2OW1DVGQ0aTNuZTVFdE11cWZKWkJ5MUtlSXZIbWhn?=
 =?utf-8?B?b3hWUk9LRVVGSlJIRklwQW43VEl2bVhLeG5XN0plbUJEYUdLU05kY0Z1T2lC?=
 =?utf-8?B?T0twNzdnQ1p6NjlqcDZpcEVCUkUxZnRPTDd4WDN0ZC9pSldTWWhkYlh0d21o?=
 =?utf-8?B?ZXE3S2JTTHBNSld4SnN1QXRBaTFmVjI0VWlyN1BTUzVDSU9ZcUpUdkorOVdi?=
 =?utf-8?B?dzZQd050UXpaWCt1ZjlVcHRZa3hNYmhwUmdRdFh2Q3daa0ZicGlOUzRyWndR?=
 =?utf-8?B?eVJlTndCWXdsNmpwSFpDS0U4SHBIZTJJUjNka2VOLzM3b1VBbHEyOGQzTDhj?=
 =?utf-8?B?LzEzN0sxV2VUYU1qdFBRV2pwdStzYkVIMnI2QWlDNFBYU0dvN2ZISWF2ai9Q?=
 =?utf-8?B?ZCsrNW1Sem1TV2MyL2Y2cWVLcDdFenJ0TWpnTENSdmNPV245UzJobnFvcmo3?=
 =?utf-8?B?RnA0NGpnN0xEeVUvOGp5MGE0ZVRMNUFBWmU4SUFJVURFTlBJMWQ1amVBVm4w?=
 =?utf-8?B?ekhaODhYUWZoZUxpZjcySjlXNGxaNmlkK1liM3RXRlo4OUN0T2MzSlNLVjMy?=
 =?utf-8?B?U1gxU0lSaEwvYUtaNHJlVG9QTmdWRzVoVFVsSjR6and0ZDVaTER0bzFHTldy?=
 =?utf-8?B?aTE3Ty92SDFPVG5Za1VETTlCdnNNSlhpTytlTlFudElNRlNWK1hTK0NRUEN4?=
 =?utf-8?B?d0FEeXdFeHBwWU5yY0dnVFJXV29MVGhadjI4ZVhSNUNCV09ZbFBIejNUNnI2?=
 =?utf-8?B?K1E4S3BmcVdnYzRNMnNnT0xDZWZ3Z1JWZFlWZGVYanE5RGM4UTRlSHhySmVR?=
 =?utf-8?B?L1FuU09ob1BsS1cwRVErVFp5RDF5OTNiZDBmTEhtYUFsaXZSOGYyS1BvNGlS?=
 =?utf-8?B?SHgzc3dPZUZEQjJsMTFhRVBEZHQ2cVc1RWo4dFN1MGUzWTA2alBCdU8vK0VH?=
 =?utf-8?B?MklTT3RBUEtJU01FQ1hTd0xGZDkwMko0MWtNanZETHJoL2swWWp0ajM1M2tm?=
 =?utf-8?B?RUY3SWs1NnZVQXFnTTA2YW41a01uV0N5eFBKaExXQVZHWHZyRVdQbG5WOXBX?=
 =?utf-8?B?K1ZETW1WVjNtOGFRcnVZcEhqYmM1amFTamd1NGg5NXRIOFE0K25QRURhN0or?=
 =?utf-8?B?TDM1QWk5NHkrdlMrbjdYZE9sQ0J1QVkyWkt4TUY4VjYyNTRZY0xHYVdmZnlB?=
 =?utf-8?Q?iravufjL5DIeBr73g8yMatd3Y?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e6185c4-0128-4535-9b48-08dd13f945e4
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5089.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2024 00:19:10.0122
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9h7uZLBssAZlzLBo8uSCDxnu/rJmXqmaELSlXDaBUyDGJW9HmFG6H/2vlm4Cq9sC2sU3oic0Yi32DUEe/Puh+jrqj8OL49dL++f3uzyrKWM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7265
X-OriginatorOrg: intel.com



On 12/2/2024 5:48 AM, Nikita Yushchenko wrote:
> This series fixes several glitches found in the rswitch driver.
> 
> Submitting them first, before new functionality currently being
> prepared.
> 

The series lacks a net or net-next prefix to indicate the target tree.
Based on the subject titles, this appears to be a set of fixes that
could target net.

Please add the target tree prefix if you send this series again, or with
other series in the future.

Thanks,
Jake

