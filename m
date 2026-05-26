Return-Path: <linux-renesas-soc+bounces-33180-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mIkAJErsFWogfAcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33180-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2026 20:54:02 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C279B5DB98F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2026 20:54:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3E9EB3003ECB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2026 18:46:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C52093C0602;
	Tue, 26 May 2026 18:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="jkODDQDk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011045.outbound.protection.outlook.com [52.101.62.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0DCE3BCD2E;
	Tue, 26 May 2026 18:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779821200; cv=fail; b=gpbN4bxd1rA5HBo3WDYZaSX1UlZZ1BGPWrSiE1X4/8t0QH4qJU6gwGE7nCIjC0eBBe8WSHNaWxGpeEDOs+Hfn5MfTeIrF9N7NWVmJVUddK0tI6ELuLmyiouUsjRNupBBUc7olBvpi5/InYMQ17sotauRfspBJ4GyELph37masJc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779821200; c=relaxed/simple;
	bh=MSPcWXDZcD3lx4mQj2GEZxK6CIl/C7hrQK/oHQb3GXY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GyNZ8cXfTpCu2hbpnOQGaCPfrS2ajKT/j3ptfcNvQrD2CXwtm93dy9kqhHFRRRUjsaCoaT5xHHGa+rLmLw2cFSlGe5NfnRiMh0V0nhqTqHX1OBHjqEQqKkUH+2FsagFjqzxaEeYNFMB9helH42TzAOxTeYrmGVGZXsmpr2ik3oY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=jkODDQDk; arc=fail smtp.client-ip=52.101.62.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qe2gM3kuiy5tg9hI6w7FlfVmRgu47aClpNJh9LdwSTiPsfkUw7ZSJClS8cLFq7NfodUE7BYcjVrbLu2zZdbJ6gTysOKwCduyHSBcASNM+lJV6pvotUBOUIOcTPBnQFh3OAKTNM1i0cxNeDE/yzcEmIHv8nnzTiQ9b3WYhYZyB1euaMh/FHbP0YjsLvJxfvNlAU2hy+ci0FGOpZACgsSN5Yn5zuBVP7g0CpZehtEKuUSWjomgFsDBGCP9YGekLnUtv6CBttq71ewwPXZh0k2+ISui/4DMy+8YsbirTJYSUGft0n7uOM1G1fbiZgDs174itD37CY35+ziAiP6mCu1nYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=usmq5QS9PZSu1k4Wjaqclft5D5ClHR0nk+5vOHKFCwY=;
 b=HzV5HhOw/1HVL9lMXtBCvFMrS3P+bGdj2D19JhgJX3luse2VK9XMTdxepdNVbn07MxNA9VjGfU3CeoTUNCfHAkdMAiTRSQr8lgZxSRle8dnBNm0wNI1Tll0HDw+oifiWBj/k1tPXZJSUS69EAA3OrkRjS2qS1NRLF/TJuTEHEPqIHCcNz8Nw86jFGJ+BQZgz9rakOAd7S9CiiyOgjCMFUq8a2f1K9OMmVHYXMF5mnt//bk1CPe42DWOF8AKyXvUfSJyLOmce29Cgm+f3WVXKctYvqtVyaTWePJXvE6jyCb8v0rLaL+8Ic6/jD8i60w7LlkrLqnKSqcj+bVIkpz/cBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=usmq5QS9PZSu1k4Wjaqclft5D5ClHR0nk+5vOHKFCwY=;
 b=jkODDQDk4VwOh/NMuGuhLnONP8b46sAqQlhFSEvP+YDDhNHDXcYCn5EE6wPkNu5s41bwEhNjBds01g6ZoIcfAyO4dquw7AlxM+s0dY7FZxDzYF4mX4cX4BdEc1afK9gqyxjPt7iAbuPib1hfP86rEx3lHFOQ6bAkL2jBmsO1EGM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by IA0PR12MB8908.namprd12.prod.outlook.com (2603:10b6:208:48a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Tue, 26 May
 2026 18:46:34 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%6]) with mapi id 15.21.0071.010; Tue, 26 May 2026
 18:46:34 +0000
Message-ID: <27db214f-b57b-45ab-8deb-da2aa8efb9d7@amd.com>
Date: Tue, 26 May 2026 12:46:30 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/8] drm/amd/display: use
 drmm_writeback_connector_init()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
References: <20260505-wb-drop-encoder-v5-0-42567b7c7af2@oss.qualcomm.com>
 <20260505-wb-drop-encoder-v5-2-42567b7c7af2@oss.qualcomm.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20260505-wb-drop-encoder-v5-2-42567b7c7af2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0373.namprd04.prod.outlook.com
 (2603:10b6:303:81::18) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|IA0PR12MB8908:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c6440b8-df28-4c2b-9ee1-08debb571be8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|921020|11063799006|4143699003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	ZeDg00k6sX2zVdXsLIJBFA6DJSBWr0PnHvTOrKI+GMnZvGYDjuaT1p0Ymo6P8hYg87jNYjOn5FP0PULpiXZWTT0xXJ6GJzf6U3hggCG6Bjge2MqODdbOS+2QlDT3mWoINJmhRyQFVQC8khCKBzJ92XMK6u/1NW4EusyYTiWgEmGfn9kdVnxo7DhOQt3E2ty6EAN+LcCVTFKuAJ0noSkWEgvSIiKXw2Q7IsXOLK0CDEjQFHJFOWh9V6YWJpQgoGc4T1v9ABXWmE10Zxu35lXYTZV5jSQLc8rZnRQdSkZ8hiKkoAjqe44Z2QoNLbsHYGn0gurXPlQWgN0ceA0mNHCuTXyU2/aWx6oxqW2ASrhBHrZnrMqx0bczt/GJJ6WXL61wathm30FT39hIAF62iiM3qGplbCw5tp06LifA/cbCzsGD2FlasonSmxg3UYbR9439qtwo6ip8Q0+9mJyrWM07Ok917hTh54ny2XWGKqKuZ1f1zTGbdrop21NQmgs1Vk4NE5IUyDoQ0L67Ut86DwI0QlQR0qoRlQPaevRuabEMLLGdkSXnAIisk4zo64HnnFcERFM9OD2Q+c6VItciatCnkrMOlMozN3CHjf96DpxOx4m557r/3fXDjHc1lqfF7uDtSnmIx3/MFVGMwtcU5rM/RrEDhr5WQ31XoLI8hpzWj23jy5bBFbGm415xspAf5A00OHSel807DhDMjRz9wH0U4jIhfywMxa5ShVUZO++8oUk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8476.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020)(11063799006)(4143699003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Nk0yNUVURlJVdlN3bzBrNWVDcTA3cWpvUUlON3lpemtMY0VMVXVOWTVnbm9q?=
 =?utf-8?B?Y0FGT3huOEN0ZzRiN1llMjBDSDNxWm9sY2gxS3I2VE5pTlVBSjJPTDZpZmhC?=
 =?utf-8?B?emxZS2k3UmQyYkI1eTFZZFBWWmpSZFJ0Z1FWZlJGNStVcFFCNG9xd0ZCOC9L?=
 =?utf-8?B?TU1BNHZoald1WXRUSnNqVjhTSzBOc0diWlJOSDVDVUI2RDQwUEJEL3hOWHp0?=
 =?utf-8?B?NXVtdkwyVEtESTkwMHdoVTN1aVpWWEtuUU5HRVRPYVZQTDA1WHNrTUdycXNq?=
 =?utf-8?B?UnI1amJKWGtIb2FjZkxUdnZ0TmhkN0tHYUQreWZYQk5DMVZHNVZWNDBNZUJ1?=
 =?utf-8?B?cjFSQTd6T0doK0d2V3pGQWhuVWRtdFdyOFlNM3NMb0hYVHl6Q1ZqaGlzS1lo?=
 =?utf-8?B?R2JhdUoySGtEOCthbkEyS3B3d0dFMXJ2ZmZpK3JEUDZ5NWdEa2h6YVU2eUJ1?=
 =?utf-8?B?dEZGVEFBMlhidjRKWldsczZCOGs4Vm1NbWN2R2NHTnp1MnNPckdsMUQveU42?=
 =?utf-8?B?ZjIyKzdlU3Q1SFE5ZTduZ0RvTmFQTGMyS0hydmVEQ25YNmpLdmoxa1NTRy9J?=
 =?utf-8?B?Z080VGxyRkoxcVZnc2JiNVoySm05cXhFTU5RaERLallzak5valJKa0JxaUhz?=
 =?utf-8?B?WHhNNmJmNit4d1pYdTBTUXVRVDJrblNlTUNseXUzNzRVN0JQbGFGdFZlYzE5?=
 =?utf-8?B?eFEwN083bUFETmlMTTh3UVNHWFBhYlczbDdtYzVDWnBDQktrRlg5bHc1MFdM?=
 =?utf-8?B?aGZmcUxKN1kzN3dwcEk3STFPS1ZSTWVMNWw2ZUc5cmRpT3pLaVFabURucmNL?=
 =?utf-8?B?UmJqN2t1V1VxWE04eE43Wlk0OEVBb2Q1SHpxWVBmK0lZbjh3YWpZemtUYTBx?=
 =?utf-8?B?WStTNVZ5YWhZaExSL3RPYldlcEFYMTJ1ek00VjFNWFp6elBpVytMUnV6dDFx?=
 =?utf-8?B?aFJabDBpU1hNUnJCSWgxN2ZlN2g4UUovNWsyc0krOWdXbWNhZ3BwaGRsVnhx?=
 =?utf-8?B?clJhM05JOExxVXVONWtWL2ZGVi84aVo2d3dua3BxRHZ1SzdsMFpKd1JtbVpG?=
 =?utf-8?B?Z0FuNE1TRU9mRmRKSFhjOGtaWHJXWjR5blQ2eHgzcHo4UUh2ckRwQXZQK0cz?=
 =?utf-8?B?d0pGV2RjZ244Z1doMXhMZkwxVFRWcjZhNGhhT2Q3SXBWOG9rRnZ1MWRxWDRC?=
 =?utf-8?B?K09HMUtGeG9UeStDOXU1YTdRYkFaQ3dRMlpubHhmRVQ2QTYyeTJidHJSODY4?=
 =?utf-8?B?SlFUVW8za1BKK3lnS3JaaE5udTJ5VHNKVVN2R3pOMzRoR0ZVK2l4dUdqNSs0?=
 =?utf-8?B?bXhqMTJxbHpKRnJSWTBZbUhUSnFLMER5RC96TEZJTTBVMHBXVW1ncC9TS0xY?=
 =?utf-8?B?WGdQbEsrbVNQekdGQ2FQQWJxdjVXVzdpa21hWk1JeFRGcEU0T091QmRjTGdJ?=
 =?utf-8?B?YWR5VC81YnNtc1dtSllhUm1HbExCMnRxSWY5bUhMalBReHRWck4xR21weGkx?=
 =?utf-8?B?Z3dMSDJqaUc4UWMrU0hYSGx4ZGFGSlQ2SHBvV0tCQzVnUXQ1NXZRbFQ5SWd5?=
 =?utf-8?B?ZUtjQytDeGtVbFlSRWZzWWl3K3NiTVNlcm42QXl3czdpTDFpSUNVNlVxMS85?=
 =?utf-8?B?UTlWUWN5TEtKemZOVU1OdjNvVnBLcjRubDdUZ0JKbnduVThjV1ZRZWFFWkRK?=
 =?utf-8?B?aDh0cERJWXhsVmd0U2Q4b2F0Q01nY3gyVS9oZG9HZDR6dmU1N1p0WlhSdkIy?=
 =?utf-8?B?UFRNS3lONk9MbzJFSUF0Tlk5dE5xZlhNMjlrMjBncXc3cnlERTdRMUx2ZWRP?=
 =?utf-8?B?czl2WG9MU3kyb3E2aWFpWC9wekJzVHBCbmVERzd6blowVmJ6NmdvbCtDZ0tx?=
 =?utf-8?B?R3VzL0xsc1NuSDVGejAwOHNyOHl4VXpYVmN3RGs0OThMRFE0cXFmSTJxZWdw?=
 =?utf-8?B?cXJDa201RFpNZzhWZnJxcklWdWN4QzBxVjIrS3hzTFVGakxPdkw3dlNOY01S?=
 =?utf-8?B?TFhJS1QxSVBpTkw2elRGcEowdXBUNGY5cS8zaXB3Y1VRTFdrcksxeDRHbU1y?=
 =?utf-8?B?bEdxbnRSenlQY2trSUFxcHFpWmloOTFEcHc1QVdwZlZCYnBYY29yOUF2Tms1?=
 =?utf-8?B?WGZ6TS9MV3ZYYW1aY2Uza3RDTURGWXlQOFBJMUxLZWtIYzkvVUdkRWJkRHAw?=
 =?utf-8?B?aGJjUHVyZDdZcEZEb0llTURmNXFBRkNtNDg3Z0M3SGxlVVo1aGhmSWY1ZUJQ?=
 =?utf-8?B?SnAwNkErTEZ0UGZBQWlmUUtTNGY3U0NtdFlNQWhMSTNNV2E0TVllN0FYNG9D?=
 =?utf-8?B?NDBYeFFQc2NFOEtCSG05dlYyNHlDYlVpbloxOG4yQ2J3Nml2S21jZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c6440b8-df28-4c2b-9ee1-08debb571be8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 18:46:33.9598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jvjeCAD2BI77z78UAtaW+h4eqDcnD6vZvs/mrvi3B8y2FmN5LLomaL2oghRsVwejLguSZdvAq1mAy+vVUTfseA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8908
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33180-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.intel.com,intel.com,amd.com,igalia.com,gmail.com,ffwll.ch,arm.com,kernel.org,suse.de,linux.dev,poorly.run,somainline.org,ideasonboard.com,glider.be,raspberrypi.com,wanadoo.fr,bootlin.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alex.hung@amd.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,bootlin.com:email,intel.com:email,qualcomm.com:email,amd.com:mid,amd.com:dkim]
X-Rspamd-Queue-Id: C279B5DB98F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Will allocating wbcon with drmm_kzalloc before calling 
amdgpu_dm_wb_connector_init be more memory-safe as below?


@@ -5790,7 +5791,8 @@ static int amdgpu_dm_initialize_drm_device(struct 
amdgpu_device *adev)
  		link = dc_get_link_at_index(dm->dc, i);

  		if (link->connector_signal == SIGNAL_TYPE_VIRTUAL) {
-			struct amdgpu_dm_wb_connector *wbcon = kzalloc_obj(*wbcon);
+			struct amdgpu_dm_wb_connector *wbcon =
+				drmm_kzalloc(adev_to_drm(adev), sizeof(*wbcon), GFP_KERNEL);

  			if (!wbcon) {
  				drm_err(adev_to_drm(adev), "KMS: Failed to allocate writeback 
connector\n");
@@ -5799,7 +5801,6 @@ static int amdgpu_dm_initialize_drm_device(struct 
amdgpu_device *adev)

  			if (amdgpu_dm_wb_connector_init(dm, wbcon, i)) {
  				drm_err(adev_to_drm(adev), "KMS: Failed to initialize writeback 
connector\n");
-				kfree(wbcon);
  				continue;
  			}

On 5/4/26 18:24, Dmitry Baryshkov wrote:
> The driver uses drm_writeback_connector_init() instead of its drmm
> counterpart, but it doesn't perform the job queue cleanup (neither
> manually nor by calling drm_writeback_connector_cleanup()). On the
> contrary, the drmm_writeback_connector_init() function ensures the
> proper cleanup of the job queue.
> 
> Use drmm_plain_encoder_alloc() to allocate simple encoder and
> drmm_writeback_connector_init() in order to initialize writeback
> connector instance.
> 
> Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c    |  2 +-
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c | 18 +++++++++++++-----
>   2 files changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index e96a12ff2d31..2ac64495cdb7 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -10683,7 +10683,7 @@ static void dm_set_writeback(struct amdgpu_display_manager *dm,
>   		return;
>   	}
>   
> -	acrtc = to_amdgpu_crtc(wb_conn->encoder.crtc);
> +	acrtc = to_amdgpu_crtc(crtc_state->base.crtc);
>   	if (!acrtc) {
>   		drm_err(adev_to_drm(adev), "no amdgpu_crtc found\n");
>   		kfree(wb_info);
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
> index 110f0173eee6..fdc3da40452f 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
> @@ -169,7 +169,6 @@ static const struct drm_encoder_helper_funcs amdgpu_dm_wb_encoder_helper_funcs =
>   
>   static const struct drm_connector_funcs amdgpu_dm_wb_connector_funcs = {
>   	.fill_modes = drm_helper_probe_single_connector_modes,
> -	.destroy = drm_connector_cleanup,
>   	.reset = amdgpu_dm_connector_funcs_reset,
>   	.atomic_duplicate_state = amdgpu_dm_connector_atomic_duplicate_state,
>   	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> @@ -188,17 +187,26 @@ int amdgpu_dm_wb_connector_init(struct amdgpu_display_manager *dm,
>   	struct dc *dc = dm->dc;
>   	struct dc_link *link = dc_get_link_at_index(dc, link_index);
>   	int res = 0;
> +	struct drm_encoder *encoder;
> +
> +	encoder = drmm_plain_encoder_alloc(&dm->adev->ddev, NULL,
> +					   DRM_MODE_ENCODER_VIRTUAL, NULL);
> +	if (IS_ERR(encoder))
> +		return PTR_ERR(encoder);
> +
> +	drm_encoder_helper_add(encoder, &amdgpu_dm_wb_encoder_helper_funcs);
> +
> +	encoder->possible_crtcs = amdgpu_dm_get_encoder_crtc_mask(dm->adev);
>   
>   	wbcon->link = link;
>   
>   	drm_connector_helper_add(&wbcon->base.base, &amdgpu_dm_wb_conn_helper_funcs);
>   
> -	res = drm_writeback_connector_init(&dm->adev->ddev, &wbcon->base,
> +	res = drmm_writeback_connector_init(&dm->adev->ddev, &wbcon->base,
>   					    &amdgpu_dm_wb_connector_funcs,
> -					    &amdgpu_dm_wb_encoder_helper_funcs,
> +					    encoder,
>   					    amdgpu_dm_wb_formats,
> -					    ARRAY_SIZE(amdgpu_dm_wb_formats),
> -					    amdgpu_dm_get_encoder_crtc_mask(dm->adev));
> +					    ARRAY_SIZE(amdgpu_dm_wb_formats));
>   
>   	if (res)
>   		return res;
> 


