Return-Path: <linux-renesas-soc+bounces-10878-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5CA9E3068
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Dec 2024 01:28:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2069DB22F8C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Dec 2024 00:27:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BDDF1373;
	Wed,  4 Dec 2024 00:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CfQQorCs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1B9624;
	Wed,  4 Dec 2024 00:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733272044; cv=fail; b=CeaW6jKOzWWT8Al/+UU99QiDX3kpqXhZOnz1vhJlZvIbQrKp5U5OsQ2NhGAlU9wORN/eZFLQgeQk4R2rG/sl4pQbeBb3w43jN2T/+51n2K9/rkMB/DjnIcRX6QLsuZRhScZdi0jc+7CxsUOzC2rZQ7myE8KkIY9iFnPHaYy4nIg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733272044; c=relaxed/simple;
	bh=+0s1YbCP8cfULl2QfV3yGAlMo40nVd2MkShqUSxuuJU=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XHn1x0chbnjyUYbL1ppSblDn5UmxdxL1oRu1w8lNbVSMvrvcagHUJD+nMZmKrx3hrVMlSZ4grqd/vsv8CPGB9Nf43+5Fmv8RuPGAQQ8oJnZfMzdXIFfK6FoBUxb1ZuthW76wtp1c/U0wvN0WzEvJOlAO7c/0Sv/CkT8wntRh4Co=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CfQQorCs; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733272042; x=1764808042;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=+0s1YbCP8cfULl2QfV3yGAlMo40nVd2MkShqUSxuuJU=;
  b=CfQQorCsrVgqAL82kLyHpwzR3/9sl75Pz0DaQFZfHWroJqjUzUQ/lyw4
   C9RNkdbQiDFY2kBTZImJOq2RRQ1CDPaDoIaeNDu65b7A01iv1eDVfjL3V
   q9mHSOY4316sQkiXSrEm2/oHIBDEz9hKa+Mo2PbRNjsRjMXZmu9yrOAnw
   nW9qJElfzz4frgGfmqn3Ob/G4kSlsV3/WaF56URNXf+S8i6lL77ZpSRF+
   Yqe5fa8WVFtlJmC82gPJeZHK58qmJ9kiv+los6uA1k02tjokxJoMutbd/
   wD4MY9/KB3jTjXSBiKdOAc0zISCAqTGa6pYtY5dxUGv1KpQnsiirVBYh+
   Q==;
X-CSE-ConnectionGUID: PLymzhdNSguv7zG/FiBIug==
X-CSE-MsgGUID: 0DYL50fJSImtxJa8vufKEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="37289039"
X-IronPort-AV: E=Sophos;i="6.12,206,1728975600"; 
   d="scan'208";a="37289039"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 16:27:21 -0800
X-CSE-ConnectionGUID: Ev8iD389R0eQ1mC+TS7gHw==
X-CSE-MsgGUID: 7YogN7x2RNWdG53tcXpCZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,206,1728975600"; 
   d="scan'208";a="93684468"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 03 Dec 2024 16:27:22 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Dec 2024 16:27:20 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 3 Dec 2024 16:27:20 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.48) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 3 Dec 2024 16:27:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UGeALOZ5UnfwKLUaAama7e6AasAJYRoQuQJkG38lPRnOfDHlyrv2hkCNiAGBmdaBlD2cUeGNJ/u89aKGBspAFEXKNhBVXCiN91x0ZZsiuTkHZVjaVbPGJv3BVR9TblMbtTWec+wIbiwTxB/s5kftUAXtg3TnTcEemJv+4GywTa6PeApU8rzOcfwY5+2hy/qfjf0d9dm4cLiYNFRFr01bdqJUzzAGikVf6vDuopYZNZWxZ3JXUuMrTGHX8kJK6D4Y/6WHtunp8N3C+U8ypfa3N9zZYRMjSQ6UOTjzG7jy2iloRX1J2GDw3eRSVoFzVgevufh5UjMXZPPDhSOIIbUdvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WzBz/BMRoZdzU1PnVcDvFc7z/E0PMslT0epMBdeNeCc=;
 b=u5K8g4t5qSiM2eB2RvTpQeGlmnXIrmaNYobwYuT5IeIAknNgVMXtgMmGRjv4+xeSv/rmx29PZH2aoDl1ypM4AO+OPE+/dH9zQx1OJaJPMEKVCcHeh70vbqRZy2pAAXh8d24ML/4+2M1TCTKYLmzGMCmq5ts/Auq+uo7tHdYZM2HvHEWRn+GfohRBdW28KZtzJyV88uOhBqNj/rNDBE+8Js72tHpz+cSh7l7K9tIwZNAskA0D+azT8pvDgVMstsIWqC4G+u4KCBlAUiMThWpzqIffwe6YL09O+JZKgosyca3ATxgSNynyrUaPygE1b9b4HeWTbMF0/NsoRCoLHNZTRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5089.namprd11.prod.outlook.com (2603:10b6:303:9b::16)
 by SJ0PR11MB4959.namprd11.prod.outlook.com (2603:10b6:a03:2de::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Wed, 4 Dec
 2024 00:27:18 +0000
Received: from CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::7de8:e1b1:a3b:b8a8]) by CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::7de8:e1b1:a3b:b8a8%4]) with mapi id 15.20.8207.017; Wed, 4 Dec 2024
 00:27:18 +0000
Message-ID: <ffb111d0-3cd4-4a1f-8c84-26675e21f1a6@intel.com>
Date: Tue, 3 Dec 2024 16:27:15 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] net: renesas: rswitch: do not deinit disabled ports
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
 <20241202134904.3882317-5-nikita.yoush@cogentembedded.com>
Content-Language: en-US
From: Jacob Keller <jacob.e.keller@intel.com>
In-Reply-To: <20241202134904.3882317-5-nikita.yoush@cogentembedded.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0163.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::18) To CO1PR11MB5089.namprd11.prod.outlook.com
 (2603:10b6:303:9b::16)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5089:EE_|SJ0PR11MB4959:EE_
X-MS-Office365-Filtering-Correlation-Id: 5636b94c-fdfe-475c-dabb-08dd13fa68eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZWRGUlcxQWk1bGsxZjRybmgvbUpHTmxaVDNudXVDREhhY3lEeHB0aXd2dlk3?=
 =?utf-8?B?WDI5Q21kZFQ0aVZ0VXQ0ckRBeU5hL3Jkb1dZM2hrUVJ0bkRmdlF2VkVzeEoz?=
 =?utf-8?B?eWNCeldkYWh1c2d2YXlKVEdVVWRZRllaelpkeDNwRmMzM3FmOTlrNTdRLzRn?=
 =?utf-8?B?UUhkUGJyWlliUHhtZitQNmhkRFRvYWt2TkU2eTVTWE84bytValRaaUhMWEsx?=
 =?utf-8?B?cENVOURuMThuMmw2R0h1WWc1QUs5dE1IKzAvOUROK3RDM3FOS0gxdU42UExt?=
 =?utf-8?B?UmpLek1DZlBDeXpxRkRFUUFSQmdqUnhiaWUrZWNjVVorV3kyeklBSTNpYnk1?=
 =?utf-8?B?OGQ2dkpuVzlPWlp6cG9yU1FUMHVoSDVLOGUvSFdTb1R6R2RqQWdQTTZWZUZV?=
 =?utf-8?B?L3N4OUN6RllmYU5xYzdGNDRaOVFtZ05yRUlqdVZiWitPaHFTaHByWDNGZWUv?=
 =?utf-8?B?QWh3OFE4b1lOZG0vZXB3QjduL1RLU3lsQys1NWxXNVBSNWF0aThrcHcyaUM4?=
 =?utf-8?B?YXkvTk00NlR3TzNETGlZVDN4a21LclZEbDJBbVcxT0tDejNrWjViRHVxSnJt?=
 =?utf-8?B?OXdBRnVjbVdpMXJNMmlJWjdlQzJlWnR3NVpDajBQUVBTdTFZNWxPL0UzeElw?=
 =?utf-8?B?Uk1vVmZjTWdwQzNxeGRmRzF1OHpaaTFobDhxRGV1NER5NEE5R2lVWGFNbVdi?=
 =?utf-8?B?M3d1QU1uRGV6L0wxdkMyekNCNit3RENFcWJsYkVmcUwxWDNTbXh2Um5nRi9F?=
 =?utf-8?B?eEJPemtQRnlialFQam8wR01WbGRUQ2tLZ2xaZy9EenFhUE83SWZYdjdOMSt3?=
 =?utf-8?B?dThPT0wvcHQ5S3RJUjJpeFdZTHBzWFJaSGloRmZsaVErYlAwTi9RRktBaHBk?=
 =?utf-8?B?dU0zMVJVTk9lZ2sxMG5nbEZrbTJYVkMreFVvd0pEQ2RjRjRHeHFhVUk1TzVs?=
 =?utf-8?B?ck5lQXd3Qkg5TzZBMjJxUEtSNEJPU1Zpd1ZTdGZWNEpyWTFZVVpZQXFTZDdT?=
 =?utf-8?B?WjVoNzhrbFM2NU1UMmRxald2SjNqaENoUWs5STMrQnh3cThUSys3dmZqbzdH?=
 =?utf-8?B?aERoUW8xa3UyNHRvNHNzZGxQY0N4TjM4NGZhbXF2b0pjQjZSUTNXT243d01w?=
 =?utf-8?B?UjJKbVRBaEFBTmdMOG8rZERGZjJqZXlSUVZPRnd0VTZ0bHZiQUdoTnZPNkgy?=
 =?utf-8?B?d2JGM2RhRzdQbkZUQkluVFNCeEFaeW5jYlN1RVg2OG1aZmE3eGFjdjZYZ2Rx?=
 =?utf-8?B?SHNLSTZaTlZxd0ZpY2RaOVVtcGpoOXNJQXVPc0NOTDRGTEVUbE9nV2ZUUUdo?=
 =?utf-8?B?OFJTL1EzTXZCa2Q2RlZ0ZHEwdENCNHZJTTBRY0ZKdEt3RWlxYUdJRXJQTTl4?=
 =?utf-8?B?a1ZBSysyR1I1NUxYUFRBZHUzY3FHdDlKQ3VZdmUwaHVVQ1F3ZGdZb1EwUEQ1?=
 =?utf-8?B?RWxqaG8va2xITHBwMEZ6MmJ2QzlWUnFuakNpTEExd3FseEdJL0M4RGx5VWtZ?=
 =?utf-8?B?ZEs0eXlUamY5WjE5aVRxMEpyWDY4Y1lXb3FtRWtnMFMxa01td2hQNTNIa3JZ?=
 =?utf-8?B?NmxKblc0eFdiMmJnVzlZVWhyVmhUc1MwbkZDNlhPTEtva1BDMnB0Z3c1YWdE?=
 =?utf-8?B?SDBPMlNDdEJmczdxYTduQjZBTUU1cjA5a3ZzUzhWb3h5cWNuSkZGZ2c4eFVa?=
 =?utf-8?B?RG5aVWUydGJVRmU1dFFmQVNXNmxqZnpWQUhzTCtIUjJDUHpTaGU4MHpQN3NG?=
 =?utf-8?B?L1djNUVKYXVkMGcxWTd6N2dOeUZURTFOT3IvdkpWY2pqZ3h4bitnNGpUSXdt?=
 =?utf-8?B?YWl1MVlUMDErdEhpaVFYQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5089.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHJMaEtSc3VaYStsRDB0VlZOallhdGtkaGk4VnpHREJGV0podlA4ZXNPaFc3?=
 =?utf-8?B?Wng0YjdLamQ0d0ZtKzRGK1IrRUpQczMyblNERHdEZDJtSGx1OFNKQ1dGUmxK?=
 =?utf-8?B?OC9qMkdZZnFmS045dlNJMXhEU0pHV0twZ2IvcEpQSmZpK2lNeVpseHkva0Jn?=
 =?utf-8?B?RjJnQnBYby9uZmlIZ2syTG5UMm5mdTN1Q2kyRVkvd0xHTmltbFgydHVlRThD?=
 =?utf-8?B?eVAxSzd1YThvTjhERzFKdHZiSUJ2eFR2WEc2RGxMUlcvTFlSc3Nna3JvRGhi?=
 =?utf-8?B?R2JxWXc5SWlvL1h5TFBJdENuVUxvVnlrallNeDlkWlhVbkJJVFNLOWtVdWRq?=
 =?utf-8?B?V1ovdm1YUlg5Wjk0cUFqa0FQaEU0V2JTU3RmQnpVaDByMGJWbXczczJDZkFx?=
 =?utf-8?B?dTdjWG41NWVsdG9pY1V1RnVMMkFzRk93VjJOaWxCc1d0a0M1Z2Q2SVNYOHUx?=
 =?utf-8?B?dUp1RHVDQkc3MnBmYTNMcSs5Z3FUN09GZFdGVlJ1QkxmN1NOTFlsaUFRNEVu?=
 =?utf-8?B?bHo1Rk5YSTVEblRRSWNpampNV005L3A0dVVyeFZ1U0dzUmdxbTZodEZ5bUVD?=
 =?utf-8?B?em5NMkh0dnR1OXBMZHppMm5DYjRUbVlwTTFlcmlCdmhWbDM0VzFIL0lSWXRN?=
 =?utf-8?B?Mmp3U1VOa2NmejQ4Z3d4d0VsU2pMWThGV1Q4VXFzRUJVNUFwL2lBM3orSFJ4?=
 =?utf-8?B?SnJCWFo2L2pPQS9VVEtiTnBFeGhpZ1VndzR0bzNEb2Y0a0NZNkZqZlJRbGh3?=
 =?utf-8?B?cmtlbUlvTlo3aXNmaTY3bnMwa1VPTEk5S1JBZlVBVU5neGlzcUVkRWxBNm50?=
 =?utf-8?B?SFcxRUVWK1c4VlNVRytNcHNjeU40cWF2eFpXVUlVbUc4bjdTRTlGb1BwUWQ0?=
 =?utf-8?B?bkNGZDRSMW80c2tLdlI2UmVzKzNNMzFTZmN3MmRQbGFycnFnRWEyWm9GaGRJ?=
 =?utf-8?B?TXIrTDFZeXN4TngralprZmRUTWtxd2oyRWVsV2ZzbERqRXl5b3JuVE5MamEx?=
 =?utf-8?B?TEhSdkhvWHBaQmlwaEk4bFFlU1lhL3VDMmdJbjRBZ2swdjZ2M1ExWWxyUW1H?=
 =?utf-8?B?Y01ldEdpUCtJemQ1WER4NWNRcm54Q0JpblV2bTJOYUdSMVl5UWlVK1pkaG8v?=
 =?utf-8?B?NVpCeGpIQXNtekpVbHVhcXZaSTc3QWE5N3FJem44R3FKRkRYMGdGK3FtOTVT?=
 =?utf-8?B?c09TbjE4cXp0R200OGp1alQ4OXdsOW54Y2g1dlJTazBIZ3hKNmFTVEFNSHJZ?=
 =?utf-8?B?OTZZRVEwR29FTzZMbTRwdzFNZ2x3QTdqWXM3ejQ4ZUhvNWRITzI4WmY0cjhu?=
 =?utf-8?B?V1pmbmdDRm1mVUtkbzE2bitsWkZwc2hzZWdqQ014eU0rU1l4V25PZ1pSWkkv?=
 =?utf-8?B?bEc2WmtRcmcvZldWNHUxYy8rUGdxaXZ4L29uVTZWVDA1VlpkclR4Z09pWmNF?=
 =?utf-8?B?NXdJZFd6RkQ1bEJJY3o5Q0tvc0ZRSVlLR0twbUtYRG5OdEJkV1JSVXFNZHkv?=
 =?utf-8?B?K3ZDS2k2dWdZTlplTmplVEFrb3hJbVBWV3BHaXJoeTRVc0NCT0ZDdUJwRzNm?=
 =?utf-8?B?emRzUlRWNUs3SFNmRzNmcFg1S1J4Y3crUEdoSjlUcTlvMFRMUHRBWmJZYW1i?=
 =?utf-8?B?eEtlbDVNQ3VlMWJJVWlsWlUyOXFXaE53MUVlQThNR1dOdTFtSzh4YVM4b25J?=
 =?utf-8?B?RXhwek8vYjd4QjVNTGl5bEhTZWN6TzBCa0NnNnl2eldTbXljWStwajE1ZVBC?=
 =?utf-8?B?TTgxM2Exc1ZWdm9ISDRWZmwySEFNQ21qWW55emxxYWVBRm4rdC9WN3JqK2tv?=
 =?utf-8?B?NWFnU2pGeExOU04zQ2VzNWNkeEtvdUpuOWc3MEtmVlExK09NaE8rLzdRODFH?=
 =?utf-8?B?UjZTaU9COEFZUmx3aVU5YStJVUJZdThYZkwzcGwxMVhvWEE0WWdldEQ4eGZq?=
 =?utf-8?B?QnlrT2o3RUJoWC9aVXc0UHExOWdSTCtnMjE0TGQyL0RSSHZ5QUREd3VNMTAy?=
 =?utf-8?B?WitCMWRPODFnUVpHSlE2OEpFWkRIVlUvSEc3UVNxTThTczZaYU5STkFpLzR2?=
 =?utf-8?B?NlF5UFFCaGJKeXh2cDZxeXN0V2srKzEwVXB6eGswd0lFV0hBOG5oWVpzclFZ?=
 =?utf-8?B?SndnOHhOU3RNMzZ4QnhaZUNFYzlzNUhYeTF6N3dSdHZ3SjNpZTMybUFaR0VR?=
 =?utf-8?B?ZUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5636b94c-fdfe-475c-dabb-08dd13fa68eb
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5089.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2024 00:27:18.0956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OwQkXwkV/mbB5EkqV8XdtSLgaFPR3FZbxSTX5GKfbDBVnt04tWjInhnikRFiy9tpbFR3rJsYoOt7fxdCXYgzo5LNLEQ/gc0fflrMxvDov9M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4959
X-OriginatorOrg: intel.com



On 12/2/2024 5:49 AM, Nikita Yushchenko wrote:
> In rswitch_ether_port_init_all(), only enabled ports are initialized.
> Then, rswitch_ether_port_deinit_all() shall also only deinitialize
> enabled ports.
> 
> Fixes: 3590918b5d07 ("net: ethernet: renesas: Add support for "Ethernet Switch"")
> Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
> ---

Do you happen to have any data on whether this causes any visible issues?

At a glance of the code, rswitch_ether_port_deinit_one appears to check
various pointers before doing anything and skips any real work if those
pointers aren't initialized.

Either way, this seems like a good cleanup, though it might not warrant
a fixes or net target if there is no user visible bug associated with it.

Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>

>  drivers/net/ethernet/renesas/rswitch.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
> index 779c05b8e05f..5980084d9211 100644
> --- a/drivers/net/ethernet/renesas/rswitch.c
> +++ b/drivers/net/ethernet/renesas/rswitch.c
> @@ -1527,7 +1527,7 @@ static void rswitch_ether_port_deinit_all(struct rswitch_private *priv)
>  {
>  	unsigned int i;
>  
> -	for (i = 0; i < RSWITCH_NUM_PORTS; i++) {
> +	rswitch_for_each_enabled_port(priv, i) {
>  		phy_exit(priv->rdev[i]->serdes);
>  		rswitch_ether_port_deinit_one(priv->rdev[i]);
>  	}


