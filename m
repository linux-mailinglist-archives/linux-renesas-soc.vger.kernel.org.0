Return-Path: <linux-renesas-soc+bounces-23155-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 05472BE3EE7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Oct 2025 16:36:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EFE41188EF77
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Oct 2025 14:36:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F9853375D3;
	Thu, 16 Oct 2025 14:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="CygM/FnX";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="pUQUtrQN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B713A306B33;
	Thu, 16 Oct 2025 14:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760625386; cv=fail; b=j7E77TabX7ieRUOVV+5v/lHhh3GdaPdeiZ1h99HP8vRmeF9DaMwK9/xwR/thCM7FF8KSjR9B4+JoSsDFxEp0nrs2cbXYerVs1dxwp7X1QoitXPHH9QkS5BbAF54h6fc+dOnO8jcOqVK0eZ/S+esWmA6Q2vuKbe1ezmboa8fujbs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760625386; c=relaxed/simple;
	bh=XxmrTlem7tdhLStE193xI/zqf8EQM/XlQdL6kpJffpg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jWdWS51f2PhxeazcSjEa1nenaJYZBWW6MiaF+dtM18WNtQtiKTYT7KDwnV2QS/nO7UFJm5CPCgfxUrWZrjGE4C6D9otJdFKwXgR7gnDewQmKZ35srYO4b8LfqTo5XV8RlIkbh+UiqrA324PYHN80jbCqeIizYEwpftzUfQhW0ik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=CygM/FnX; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=pUQUtrQN; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GEVKjU017557;
	Thu, 16 Oct 2025 14:36:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=URYGpRtEFN7pqzb/aTu8KvGwGVDMV901ByOJs+nzls4=; b=
	CygM/FnXDzDFJ8ogdfUZd6din0ODtcgu13i09wWO2zvYqSIzzeeBu2ZZitu/o3Ii
	lLHUhQ3YoSBW9uzjYs4pZxX8Q+mKXkhUMaDaxcN18Teb15JH+ZXcXz5yPMr0Ukws
	dYplxeMmd3YGFxcBfKz9RuKnvIobB6L137MZ8WiGIrils7zefFuS0c0An74sWlej
	W4WVmeFZiCACb/tfrbVtwZsrw/NTPE9gxXBOuOjlYzlbTrCtEn8tvDqZ+x+e+O3/
	3KxZp7+RojIpkpsH/2s+lbEAQEx8AAtTLfB6etNtuQBrnXoL71LlTe2NHXGu9DeZ
	itJztyOd0NL4M+gXVDoNOw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49qe59h3j0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Oct 2025 14:36:03 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59GDUFhp013620;
	Thu, 16 Oct 2025 14:36:02 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010063.outbound.protection.outlook.com [52.101.56.63])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49qdpbhsar-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Oct 2025 14:36:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lld3dqKRcX3PlgcWTrfYPU0tz3g87r7AIPl2Vk2AGnYPJdAnNWFCIBE+OVKKol3xQp2DN95LLapC9m1mLgJZIFi1a56iprQ1eCZX6Zuqt2trL7aBP+6LuX3ohAScYLgBEEptDif+3T2Dd7GS2QnYjl6eHfkJi+SWDYi/kYwzFXxhtzzKBsXM0FRyQ41GGAdu0AJ2AO+2njSOFs0YNY0nVuulei3fuoNUFtTErOPC133HWcSlxj4U7JY3NDurNwhxB1t/Ih57XHcG2cnPUuN2bbHlZdx2qRIA/ZiXCS2Mh8JFDDUI+9iJbsHn3lNrhd5WDZ3KtpcGFcSualTznxPw+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=URYGpRtEFN7pqzb/aTu8KvGwGVDMV901ByOJs+nzls4=;
 b=NpYSPjc5w0jkI0TewdE11KkxVvpnXDqsFjCcJ0iEuTlHr5r0a7U372CE5fTPGTauduyWI2r3VjLaKRRTkNMranSfa3ymO6ieGBweK8qgl9LSQaoM4Pf31RslREm38FoAGlYhE7p1sHp0XwIbP7O7kvIjYIATDqEC+shYBacwu15reRuIHVt5F6Z+cfu6/cEu04ReYiGXXdLRHlh2Wo7P5RnviOUE+LWONMdlCVe3UD6f6rkbGuV/qNJk3FyL/IqBOWpfD6Q5jg2kVEprGSl8ViNUVS5uHY9qUfc3nVVQEQPn1/yIxVH+6zhSFp87uBYhaw2ClcUCRtFAticYHgjm2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=URYGpRtEFN7pqzb/aTu8KvGwGVDMV901ByOJs+nzls4=;
 b=pUQUtrQNoKJqEUB8nL2sLUL9gSFEwzV1cDLNCZMMLOHNosh5spHXj5U0OQuyEjWA06kleEsjFlwsT+dBYnMNrh9m5vOEER+fe+dQpoRbCiCki2LNXbAy+CxTywKTD1eTxzhXWwEyOjFvc0Fhnc7zuMQT8jXjGS/xccwXikAdSKE=
Received: from DS7PR10MB5328.namprd10.prod.outlook.com (2603:10b6:5:3a6::12)
 by LV8PR10MB7822.namprd10.prod.outlook.com (2603:10b6:408:1e8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Thu, 16 Oct
 2025 14:35:59 +0000
Received: from DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c]) by DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c%6]) with mapi id 15.20.9228.009; Thu, 16 Oct 2025
 14:35:59 +0000
Message-ID: <6e04e6b9-fe60-4f5b-afae-b4c36a829c0d@oracle.com>
Date: Thu, 16 Oct 2025 20:05:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [External] : [PATCH net-next v5 3/4] net: renesas: rswitch: add
 offloading for L2 switching
To: Michael Dege <michael.dege@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Paul Barker <paul@pbarker.dev>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Nikita Yushchenko <nikita.yoush@cogentembedded.com>
References: <20250901-add_l2_switching-v5-0-5f13e46860d5@renesas.com>
 <20250901-add_l2_switching-v5-3-5f13e46860d5@renesas.com>
Content-Language: en-US
From: ALOK TIWARI <alok.a.tiwari@oracle.com>
In-Reply-To: <20250901-add_l2_switching-v5-3-5f13e46860d5@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BLAPR03CA0056.namprd03.prod.outlook.com
 (2603:10b6:208:32d::31) To DS7PR10MB5328.namprd10.prod.outlook.com
 (2603:10b6:5:3a6::12)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5328:EE_|LV8PR10MB7822:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e8a0245-2a89-4e30-e7ae-08de0cc152cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T2pEM25YZjRDWG5IQzZMZVZoRXQxeHVrOWo5VVFablhjOXhaQWZyT09LVzBv?=
 =?utf-8?B?UUdHMUcvUmRmS2ZyMDl1M0pJVGlnSVE5aVE5cE01SFd3VHdoVm9UTmR6VFJX?=
 =?utf-8?B?NlRHR3EvUm82eUw5Zkgxcnhobmg5czF6eWU1TU9nMEVVaHZmd1hrc2pBQ2tu?=
 =?utf-8?B?VG1qYjl2M3BYMzJlbzRFNFJnQ2V4RFhQUGZKai9scUxNOHFFY2NBVHlSNGVR?=
 =?utf-8?B?K21RUE8ySUl4MDFUelBLaFpIaDNvSDJvMHlpWDhIQW92UkhWaTRlaGJ0Qzd4?=
 =?utf-8?B?ZllkSGcwN2VlQnZJOGJpMXNMQWxTVlJPUEljbHN4WUF3RndDcVZKaVZyVVcx?=
 =?utf-8?B?SklqZWZkbTBwZnRnTFU0amtSQkNMTmQrOFM1VlNsSThvZGsrV1VaNncwUm5G?=
 =?utf-8?B?S2ZVYjBONnJwK3lNYVhHWktPWDFwSVBVeDlWQjh0U09qbTVIQ2dMczRIZXlN?=
 =?utf-8?B?T3R6TjBLdEUzYVhrbGNqeDRsMmE1NXJjcHdZemdaTHU1S1psYzNpZDdzMGFP?=
 =?utf-8?B?V1hYSWxpWVQwejEwLzFNeGlwSktkd1F4TG9hNEhlYW16RldFdFNNcTVkTnEz?=
 =?utf-8?B?MlUyRXlWQ0NSTXVIWHZFQllrOXlGcjk5eHYzTHpqNW81MDJqMHI1RHMvZWw3?=
 =?utf-8?B?Q1VxTmxENCtGNnVTMXdCMTlIZTBJTVozQjVHMzdsU0t4b2tPVUVKcisyOFA1?=
 =?utf-8?B?YmVOMkpNb1RxbGhuMVFkQ2JzZDl2MlRGU2JPQ3dRSnhJSTdOMFJ1MGdjRUlJ?=
 =?utf-8?B?ZVkxYnl0c3o5WGpnRCtNZ29NL3JYRHNwajlNdWNTWjArUVlIdUVZUzZ5bmRI?=
 =?utf-8?B?bGlUTm9nNk1YRlk3ZTR4OHo1RVp6ZU5VMTFqbENwN2NodEJ3UWFNZ2F4aXk3?=
 =?utf-8?B?WlVYakFOOFZ2RU1XKzJFd3BxNHpTTXdENXIzaFNHdkxHaW0xWGMwc0dkZG9i?=
 =?utf-8?B?elM5MlhkRmpFaHYwVjArcFhrWkRlRDZHKytkTDRLeFlpTS9VeVhwVFR1aHNz?=
 =?utf-8?B?RmRsRmJScmNvVDJSZkdZTEl6V0xYc3VtV051cnJ3eFI5cng4MFh2L3NVUkFI?=
 =?utf-8?B?WWh0ZkJkcElDYWFQWEF0MjRlZ2lrdzBsMmJuTjRob09BcXJ6UHU4STF6SWEv?=
 =?utf-8?B?bU53Wk8zV25oTlh4djQ0ZTVrYXhaN3Z5ZzdzeE03NzdLS3pTREZpZHdSYVRU?=
 =?utf-8?B?YitUdW9iOG9uOWhrb0tkQkVhZHJPRTUwR1FLWGFOM1dvcGo4cU5iQjl5UUFp?=
 =?utf-8?B?QWhIYjlRRktaWnhVZ3FTaU84K0trOFRLUml5cFladmYycXZnVnlkOWM1a3Mz?=
 =?utf-8?B?ODNpeWhUa1JQUGV1ZXVIYVREd0RIcXpsS2p4cmk5RTlBRHNyQWU0WG5qSFoy?=
 =?utf-8?B?WC9lWWRKSWd3cDJmcjZjMG5QNWF3Qloza01NNW1BTDFwQk5qbmhLcFhYZnRN?=
 =?utf-8?B?QW9jVGNkTDNDS3MrbEtKRkI5c2J6ZVAwWlpUSngyQ1VwTjZOZVAvbjBITWow?=
 =?utf-8?B?Z0ZYTGVXZEZ4Wm4xS0lDUlZaV04vcTZjYTBTYVBUUHY3L0pkakFFOTBFV242?=
 =?utf-8?B?bHh3TGVBVVpLQnhBdk95L2pQQmZTNlFPM3FTWkF5c3B1WU11UjJxcWlaTDZt?=
 =?utf-8?B?ais3ZTVvRXV1NmpzNDRhSUY1RmE2MFpyOUZqYnBpclhWWThhZ0E4WEZKem1Y?=
 =?utf-8?B?bnJGNFlBTFhBeDF1bWxCZ3VYQ2JlekErQ3RaYTMzbUZkQTNEUndWKzVxODJ2?=
 =?utf-8?B?Q1dHQlFVWnNGVnIvWHFmVlowZXpMQ1U0VUVhZ2o2V0MxdVNiQjVYVHQwcyts?=
 =?utf-8?B?N3M5TjdyWTdxamlKSmc4ZTBrR2sxblMwcUx6RDNqVGpWcGdKUFkxUW42NWNB?=
 =?utf-8?B?aFJoR3dMOFFKK0pBd0wwTXZMOXRwZEJZZXowV0lrbWtKVCtSeVJDcWVPdzF0?=
 =?utf-8?Q?Y55HlHkw1OZkeDs35l38Ch/0HFKs0zkd?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5328.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RkFxL09aSXJLSndRMzBDWTlVSnN6VkRUc0tvcDdNSkZGKzZzQTJJNkRPL0JQ?=
 =?utf-8?B?Q0VaN0pnSnR1RlhSdWFwcjA2a1ByN0RZTFR4TkRKNzBrM2Z0SXZFVVZvbkww?=
 =?utf-8?B?OG02YkNHQmVtSnlxUVZMRnRqaFFsL2FTOTUyL05RaTYyUHAwUjVBb2FoOEo5?=
 =?utf-8?B?Y1UzQWFyOHp5LzlXbURCbndrVzJuSC9NU2orWmhBTlA5SW4wSFZncVNNSnhl?=
 =?utf-8?B?WXhtT2NNN2FEaHBnbU5iWjIwOUNNcklMUmlEd216ak1NUWtoWnZPNC9BQm45?=
 =?utf-8?B?eUlNcFZJTWJRNnlKRFJiT01ZMVNNS3BqdDZkRzZlQkVqY1NzYnA5L3ptd2Np?=
 =?utf-8?B?RWkwU3pWSDZ3MUpFK0RDRThBaXN5ZWZnK3dIcGI4Qnp2ZmVkd0t6ZUNPTldo?=
 =?utf-8?B?NHF3T09OVkE5NHJITHlRMGljTUpBS1BDUzdrc0N3UVB5NnB0NnczNmo0aGVu?=
 =?utf-8?B?TW5HQS9RS2kzTnVycER2NTBlQ1d5emlLUWUvTXB3Q0JyZWpoMnpabVNJTEkz?=
 =?utf-8?B?V0VYOG9FSVo4Mlp6NDVXUUZONThqaXNkMTdzT3FIQ3hLM0dXWnE0WFgyY3NV?=
 =?utf-8?B?K3NDTWdJQzlYT2N4SGdocmN0K3dBbzJoV1VNbEppL2dIbDA4MEs1YVhkMURj?=
 =?utf-8?B?YUwxUkRDRUMyaVI3VmtKampvVitES2lRQUdzUlF3UG5KTVQzZnBoSmF1OWth?=
 =?utf-8?B?QS9VVTRybXZOd0VEZWorM2QwV0VpZUgrTWo2bUw5Qno0NFI0MG9PZDNHaXd4?=
 =?utf-8?B?cHhkWUg2ODNmRUhhbTJBT3luWjVEa2haZzAxQjRzSGx0QXl3MnQvRmdyTnli?=
 =?utf-8?B?TnlHTzhLUUsrcm1rdTYxTWhldno5Y2xVRmlTd0JuSVdOeWk3R1QrSEJCWUJQ?=
 =?utf-8?B?ZDJNSUQybjBMSU4wTURVTDdwMGxKZDFYZnVWMm1nbERIeFFBL042Z1FqNkF2?=
 =?utf-8?B?Tk84dU5ycUNxbVg1b3BHaXc4bUhDNjc1OHJteDk4SHJOeldVS2d6R1BuNGZF?=
 =?utf-8?B?OGtpcUhVNzBWVHVHYk1oMnpMTnprbFJPUXdpU0lXODNtWFZoM1JMM2UydWhQ?=
 =?utf-8?B?ZVRvaGc1cXF6T0tCM21YdWxHTE1jUjBIV0lEOGhiNlVkeGRaRWJSNnhURm1p?=
 =?utf-8?B?VHVUamdvRE1Sb21NbDhRQ0RPRkdsSXpxTXZLQ3cyTXBWaFp3Vm0xYldkWFdG?=
 =?utf-8?B?RTRBMVBWNm4wLzVZQUw2cEdNbzQwUHI1eXI5N1U1bmw4VVFGdENtNW9uQ0tK?=
 =?utf-8?B?cEIwMnpSR0pGWC9sNkE2UW0wQzZYMlhXcWhvV2hhRHpnUE9LTEE4dC9CMlNq?=
 =?utf-8?B?YVNlMWZjYzhtcU85bzNXWkk5RXhjbjVpT1FYVlNZZWphRm5FK2NuWFFkbDJQ?=
 =?utf-8?B?aVliQ3hFSTJ5N0NxcFp3U2Q5bitiZUlYdU1HWEkzZmFxdTRDWTk4eXpJTzUy?=
 =?utf-8?B?Q2xPa1JkWWNnVHJZU09aOUFrb2VMd0duNXJEVzIxVzdJYTAwdDVSazR0Q21t?=
 =?utf-8?B?bGEvM0tsbDZvWXliOTkzNmVHalcxUkpZYVgxMzlheWN2OStxbFJYY2dmRUpl?=
 =?utf-8?B?Vk9XY3RMazNiM0lYTlh0SHRLUUttWU0xTHppV3lDVmhWTWIycDd0Q0NHSDF0?=
 =?utf-8?B?UVRsREVwOU13T0psT1N6TlU3cGRXQmVjOHU5VjdRK3R2cEE5aFJpbGppamc3?=
 =?utf-8?B?VW1GM3JZTVdDWUNMUTlBcnc3c3lqNkRTVTl6YTlBQmpKQ0RvVFZEYU5aMjlx?=
 =?utf-8?B?NWlDeHhTM0tQSVF1MXRZWXUvMTM5YzhmWWM2Mi80ZHRWdG02YzFURzh5cFox?=
 =?utf-8?B?U2xtdTI5YmRqTFRYMCtGc1lmZXlsempuTnJwVVZ0ZGQxaWtidGZKSlZ5S2Va?=
 =?utf-8?B?SVMrbDI4ekQrcnZSVS9CNVlxeEtjQWd5ZFhPcmkydVlJcno2eHExQXArQ0xN?=
 =?utf-8?B?UXFKK096SjlSNU8xUVV3UGJ4L0JCWUI1cXNVTUlFNUZlbnNjdWE4UVNENGlR?=
 =?utf-8?B?ZU1LcFJaSnVWYzV2MlE2UzllNll2dHZubkJYOGZSY1RVTUdDMHVxUGlYVFB1?=
 =?utf-8?B?OFRvSjZiaHRWdDhQWitDVUZaUjRsUStxbHZBZTVrZ1c3VWx0NDlpQ0hvS1Vz?=
 =?utf-8?B?N2RjbVBQRS9DWHdOZ0V6YWxtb2YwV3JkSER6OTBZWTFjZ01mN1hlV2ZrUDRQ?=
 =?utf-8?B?SHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/mj6q6ruDdyNdGbZiwdyjS6vVLexQzCoLJp5npdzPnzgtKtbNOEMzuox310nX3LBBQWcx93TFtVGajN5yX+b7y+/Y3OCUeHYIClM9ntJ/UavaISH3nr7eJRcH/VGiOThQv2pyRj2nOYKFRrS/1NXHR/ZX+QwuNrvVawGh1Na03HF9M7JFDWjrnbepr+4dcTytb+tP8qpy+qT0vZBMVPcWAgmWsoAEl+TcZ4mMn3Tx8JhCRslcc2WGDTwPRXs4zKP1+l7iSTYN8uz400AC3ePyPa+Qp95VbWjmG+EWVC0ibBOplBQWOGIP5/p5vjHYdFIh6fTaMrueLVBu0/Xo/ldUpjAm9Rhx18GSAEPCm/3HpFmigqTSle3dMszs7+S1F3Rhw4Xud2LdQERyayxYmeDoXJXEaiP1/c/hxj4dJTpxYd8c+4ZMMe3UmYb4SoZRqW6djfYVDB+biHcoc50xfG4oL4btGoGh5EyNnMGCtZ3mHOn5joM/T1gppHHvqlip2Yhrn8JMRy30vpHKzqH4oGkHtjIp66ChJDmL8cfEQmQozJXpnvtx5jv84gahprxbbtu5p4yHpMxPssBx3YJ1SMNrST9ABeCbth0CnZzwMpQpX0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e8a0245-2a89-4e30-e7ae-08de0cc152cf
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5328.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 14:35:59.2160
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wtbrDFNMUz1fd4Lavk3U61llv5apjVFCiSuNPdqIKq3xX3vhpg8+Fwy4pImK6YDgOY6KrzhUVgBu/BVrVK+Q00uDPNDy4pZbY2X2ag6f8ps=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7822
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 adultscore=0
 phishscore=0 mlxlogscore=999 spamscore=0 bulkscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510020000 definitions=main-2510160107
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxMCBTYWx0ZWRfX/QHkyYa7nV8r
 6igR9hgx2avuQCUgBIWk+C7SMjVcd2aKJXRheeShZ9vsmhwTJX54qxqrNpuU8t8PcKX3+GYDLuH
 Vl+snTe0xVubWbOtGDokDyGt9XQMW+dJcbomO74xf69h0xbcjvwP9Q5WdjxRruiom+DJpRKQspU
 l7+qmMKBpNzpUuGm6Xn9cD05p4t9JKsneDH6Ny/zZ1Z0QNlKegncJ/eof+QA+f2GTWlcNWNGmOL
 CTH8CKzape5qLB3FVATc3WRma9O2CRwJUFEfIadGI0p9Bjl3k76JvpB0VHCCeGSTpweK1MKwp/S
 JVDwjcdtZNldvGQFrX3/lILy6lreCJEXzDySaS5tZVaZE0+plh2x0iKzKGo39DLFgurUmSW5Lgj
 ZvXbjHBLjin3Xu5GRskqVmi+IKnhVzO5kbCN7mCePjT2XtnGU3s=
X-Authority-Analysis: v=2.4 cv=V7JwEOni c=1 sm=1 tr=0 ts=68f102d3 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=fQMA-S23pUNlF1XN2wQA:9 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13624
X-Proofpoint-ORIG-GUID: QfdfzpKcOzrKmpq-_oy6sLdlquleu735
X-Proofpoint-GUID: QfdfzpKcOzrKmpq-_oy6sLdlquleu735

Hi Michael,

On 9/1/2025 10:28 AM, Michael Dege wrote:
> +static void rswitch_update_offload_brdev(struct rswitch_private *priv)
> +{
> +	struct net_device *offload_brdev = NULL;
> +	struct rswitch_device *rdev, *rdev2;
> +
> +	rswitch_for_all_ports(priv, rdev) {
> +		if (!rdev->brdev)
> +			continue;
> +		rswitch_for_all_ports(priv, rdev2) {
> +			if (rdev2 == rdev)
> +				break;
> +			if (rdev2->brdev == rdev->brdev) {
> +				offload_brdev = rdev->brdev;
> +				break;
> +			}
> +		}
> +		if (offload_brdev)
> +			break;
> +	}
> +
> +	if (offload_brdev == priv->offload_brdev)
> +		dev_dbg(&priv->pdev->dev,
> +			"changing l2 offload from %s to %s\n",

condition does not match the actual intent
it seems, offload_brdev != priv->offload_brdev more suitable.
I understand this code already has been merged in upstream 6.18.

> +			netdev_name(priv->offload_brdev),
> +			netdev_name(offload_brdev));
> +	else if (offload_brdev)
> +		dev_dbg(&priv->pdev->dev, "starting l2 offload for %s\n",
> +			netdev_name(offload_brdev));
> +	else if (!offload_brdev)
> +		dev_dbg(&priv->pdev->dev, "stopping l2 offload for %s\n",
> +			netdev_name(priv->offload_brdev));
> +
> +	priv->offload_brdev = offload_brdev;
> +
> +	rswitch_update_l2_offload(priv);
> +}

Thanks,
Alok

