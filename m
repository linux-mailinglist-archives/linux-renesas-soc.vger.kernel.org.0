Return-Path: <linux-renesas-soc+bounces-21952-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E0140B7D623
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Sep 2025 14:26:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D36F2527B09
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Sep 2025 04:08:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 984322E1F0D;
	Wed, 17 Sep 2025 04:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="K7cTQTNG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2080.outbound.protection.outlook.com [40.107.113.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B9129A30D;
	Wed, 17 Sep 2025 04:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758082109; cv=fail; b=OBBr0VpRMVdi6oe9+GL8UNtpGDBVXInyFNgnVkob1zpGE9vRwxJdyg9i7zv6T1fxOX7qhOrpCwYxIxVSsj0CjkdZHPpKUUd1eFZLl9Ibu6q9RdOwKrx83isg4CkX4+/la4aVzZNou0VTdKs/Io/tsJw4R0mNSubeuIJ5hh9TzR8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758082109; c=relaxed/simple;
	bh=1bh7iR8/mRpf6v5O/FVAuCZKf3wbPDRixAK0ZHIXxWI=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=f6tid0ig3xY5Wf3Usfo1q2dwkqFKFIS/dJEDVSDR+qvmQ5Zzs+isOJfSzORKCdXaRAA5Ho8FiaIHakaCnpDOQfh7XqCHrsTPUkuFF7lpIB+UAWmoEzfphBxTGEBzJ4c9sKQ9IZRHBk7/khP2bqI/G6Z+vYUcjxYWxgMVVXQ6WMY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=K7cTQTNG; arc=fail smtp.client-ip=40.107.113.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AyAA0NQGCnMUoKxXs+uS14ydLS2esQlgUY7pWFEFH8YoqvzZSV+wjJ5ebsa0RHqmVBBYJyTwsXONqucroh2iLj8/aWSli3+0fNESFNd+l8uHSd2WZyCj3GsnsHfHCSiL8i4gHll/ZRgHX1IIKqwOC4G5zFClojuif6qdck1kNeGNRM9XEel1sbnNEISjKGhEifVWnMk9EljMm4Jm+7hO45+Xl30FWtDoTqH8E2zxM23gxRrx+VlE7EJBxy8ewc6Ji8cqkCuRjn8Qa6wrP9ymUKvcVSpAsIs2mSX1UKc2ni+0xZYcUxzgXTt2As07QV5D/GdbjDkDzd3UovvfLTzEUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9KXnaA4fPYax0vqiZpBjihK8gbvr6X74CumESaWPHS0=;
 b=xX1jyk98o+8Aax8451pIGCnhRKlVEtpY3iSg/AyfmwYiKizdAdKotCMEbioMsp+g9RwPmaEmIkYFBigy2dNj2hY7jBz8KVI2Mr8Qms5cXTXSesiM+VpAx6pX4b14fUNpKyQ5z9UxvL7KWZRRm+3OHXn03B8Sz9otYpQ4gVkjql87+RqWH1TIcPlUrAL1zaAfcHuJu8iZppxtlqN4rZV8Q5699MyBFF/HCS06gBYkAH+1nZTjylDXqqKINMN0/9YdmFAl8JYZpAwQtnF6odpz+L1mELV6svNTd4KSiGj3lflD+nEME2UfcDVHKpKWgkA1gU1O9MSDbVRj02o9VdIJ/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9KXnaA4fPYax0vqiZpBjihK8gbvr6X74CumESaWPHS0=;
 b=K7cTQTNGW9n5F3kKjEJnxMtHFbxYvYpSEMqrvBO9tx2UDWVrQXmNQmtYXdxSHi0lSJRWo8Odg7OC6itpc1iAQdZg01XMuo06rx7jSGCsS9UBIGlmgw2ey5lqOR0Zuu4s9pynHDyww7T3tl7Kklo0tPNVpbfi02+JxBcoHfOvjFg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB14398.jpnprd01.prod.outlook.com
 (2603:1096:405:23c::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 17 Sep
 2025 04:08:22 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9137.012; Wed, 17 Sep 2025
 04:08:22 +0000
Message-ID: <87h5x1afgr.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Marc Zyngier <maz@kernel.org>
Cc: "Liang,  Kan" <kan.liang@linux.intel.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Ian Rogers <irogers@google.com>,
	Ingo Molnar <mingo@redhat.com>,
	James Clark <james.clark@linaro.org>,
	Jiri Olsa <jolsa@kernel.org>,
	John Garry <john.g.garry@oracle.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Leo Yan <leo.yan@linux.dev>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Rob Herring <robh@kernel.org>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Will Deacon <will@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.
 infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 5/6] arm64: dts: renesas: Add R8A78000 X5H DTs
In-Reply-To: <86v7li1xs4.wl-maz@kernel.org>
References: <87tt13i0lh.wl-kuninori.morimoto.gx@renesas.com>
	<87ms6vi0js.wl-kuninori.morimoto.gx@renesas.com>
	<86v7li1xs4.wl-maz@kernel.org>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 17 Sep 2025 04:08:21 +0000
X-ClientProxiedBy: TY4PR01CA0084.jpnprd01.prod.outlook.com
 (2603:1096:405:36c::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB14398:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f5aa4ca-9cf1-48ed-5a1f-08ddf59fd74b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nfw/MyIsmLqSZbfSQ8O0UydX7vmrRWuDncTHWJVJ6L6FrzBbiaLfbR+/d8yG?=
 =?us-ascii?Q?CA2MYWDwTGQxTKCAvH8yStHcmIr7uRNa7o6pIfm5Lo/DIdAcpfBHx5figJRs?=
 =?us-ascii?Q?cx7Bvc9F7FeCoHid+9FoHxQTVnTQShmj7cS3mpVpJ9NGWmNkXnGZrnqCD4h1?=
 =?us-ascii?Q?taGk5iXqNZU9SOgi3XfgNY2ijukobqTqwOUXYtFpsLhX75Yz4TFxrpzzcaru?=
 =?us-ascii?Q?LqGXESbNETH+DCaCyLxEobcplLYUHjhi1V4F0vv40kSWx9hY6Qb5mtyZV7kL?=
 =?us-ascii?Q?JYxBcwazw0yHazgOloTAiCBwvW00WSkpyuQv824ZqpAwSGp4rDD2qUY4CkxE?=
 =?us-ascii?Q?HNEs2lEGYUsC2suQpN4WBI1q7dNkbHUNpCN2LxEyKvk6etjvDji6RPO0aR7p?=
 =?us-ascii?Q?TUgJ4e48VF4JQfacZdsP6H+W+bS/HuJ82rtCc2fqdczECktgLFCWAKovqdRo?=
 =?us-ascii?Q?pM41A8TecWpFp7G7ma3b+kTQf9oVwWL/dcRyDK+oPtt931BvxtfbnskotxTX?=
 =?us-ascii?Q?V4BuRxClBt+EYRUfZat/NUdlna+k1G1RecTRbNol9b0NC6DeZIn2yDSHKfu9?=
 =?us-ascii?Q?0adAsb02xKnUe2v0HGMn+zVfktfYi3P6m8ZU2Uw3iI0pCDgN07/jM4NRFCJP?=
 =?us-ascii?Q?qMOGLwQ94VyPrjtsyDyXrCeGi47pXhaVC5vuXUvvKO0cEYKm4GePYwhm6BB4?=
 =?us-ascii?Q?xilCRVpyCf83AnFQdznDdAMHfchAtFCSTRwOQcyAX4EaRnvc3sJqBhTBiU5f?=
 =?us-ascii?Q?F4ZcMfhyVgYWkUM5JA2U1JdQIGHmiQmnLOI6rm+2rRl3DPEkghSvoqX5ape3?=
 =?us-ascii?Q?IiPe6MeLdqX5tqStm6SpgZc0rky4UUDj56H+AOaoOzi1ujnoxkTlZZzbEahp?=
 =?us-ascii?Q?VclfL7ynhQ8sz0Ui5zQwu1OLPPG3y1siJE6GUDQwv3fNG05Y882F0+y1n8aN?=
 =?us-ascii?Q?xDLQ/8jSoZO8vLOzQuyYuPM3yNJ9GM3tBqIbmIQ3wH0/ikn/23ZG5z4RinjY?=
 =?us-ascii?Q?bayiYaIZ8TQn/VoGte23uPlzDgz66qPwVW2b2Bo5jHwq0s1BE7IkdTq30cxJ?=
 =?us-ascii?Q?WMLE+zJFsWJBifaqni1eT22DKVgf6rXrRIYxcCWZ+9YLhNeHQnaRq291MwPV?=
 =?us-ascii?Q?zHLaYtHojSYwGsx3eelibClPUYQhwGgPbzmr/yY20hRQpO+575KsK8FC7Fk/?=
 =?us-ascii?Q?setISkhFvihpffjrrrA9hEi26RJIurhduiysqmgZgrk0HOkOg6VbQMcyjMxf?=
 =?us-ascii?Q?AUMkaPowpSXc0QDTBCnNDln1+abrpL8DZu9F652gogJT2hytZeKLsarFeVBl?=
 =?us-ascii?Q?z5DX5ANKA54xs9KG1uLc16bH7ov0NyI+QloUAoJWxUdokWKVUmD0bBwYMcy4?=
 =?us-ascii?Q?ko4gMf6f7VLoy3KdzDEi+0ithO5Cgz6qU4gYpz59npAkYgjRQyMU/YuAjtTl?=
 =?us-ascii?Q?Mhl5GNcUNbBHbbkbTG6MZfhJVSpfTtdOXhfscWuL2OPl+ZdtFrdPjg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LnAQnUZg8mD+fViIygtcY8NdmwMbbxrhkArcm58pJQa8+QVKs/Tpd27meOL8?=
 =?us-ascii?Q?WGwHOje+IWfk+xSr+FoKX91PKTpxA9xiV0nrbl/pMzXm/esW3zH/BEjB1QlL?=
 =?us-ascii?Q?3EePSdxIvyDcFuRpy41EPkOLagSbbp+XQr4zlGoYCWLwm2N9dZY8aafEhFSX?=
 =?us-ascii?Q?CUh9NGxk4cpuQN1shZDhFr+rJySNHt6zeWm79ZXR8LNuIHeaAuVACvtu3HgY?=
 =?us-ascii?Q?cLKWhDt7VegjDCt6wL+COC2Fzl0p0NfBPhc0MwYqF5KoO14v21m0oG6UXaCF?=
 =?us-ascii?Q?zm9zWgQ51sETtP3viwvAnTnQeiy2qYpvJFk8xC7qhCZzs6QMW/a0ul/ky7YE?=
 =?us-ascii?Q?iHpqBWm6kKK2d7t4A6P/MW9dhZdkrwDzRUWxYxYZmYJNW8dBsU6SDUgOKzkA?=
 =?us-ascii?Q?iqcfB0jAfERp1wNKmyejRk3zwz0ISeZ+8eufE85kOpiYL5P3aeuIGAwyFkpM?=
 =?us-ascii?Q?26G/bDSgHCbTEU2eamLIxF8oGCh78/38aIrVmkbzRSm1vQbscXH0r4UWZg6X?=
 =?us-ascii?Q?0N69sxgroGsZ0syaoQ8Dp/D6L8mqt0tMvb2T3nxqRvhMELdNc6B3YfFYXg0d?=
 =?us-ascii?Q?Z+h3gKJETsh9Ad6FEImZfcw+MczevBxjhI/xrZbFW7AmxYVxhUtcEw1woZ4Y?=
 =?us-ascii?Q?G7SM5OAJW2kQxLR2aCuXiyIGh7vWTZ1pFy23YNWQlgsHDHtGpiqDeVKmt/U+?=
 =?us-ascii?Q?2NsVgdoMAgSSv6RQib0cclQMj1Px4ONGrgZi+j+NI1LkL2Kp+EPh1zZmxbLq?=
 =?us-ascii?Q?6QCY48vUu4p75JCkaYW51xWWSccUXpy3f7iGijUvKbM8ueUm2KFnVDVdlaPk?=
 =?us-ascii?Q?g6Z4wPtg+c+i+6ZaehUqR/TnTKHI5yJowlkUQoEqZoX2cud4tUOHmD7tmS6O?=
 =?us-ascii?Q?Ow9LvYh+oKw0qTA+QGGAo58XkV+A5j3dgtPq1Micap8/g07efTreBkUcSTAk?=
 =?us-ascii?Q?WoIkEyx4M4jknt5Joryrb7mnEkyi2J/f0tt3NnHDyHW3vugZlNlSgBkUxoH3?=
 =?us-ascii?Q?d3IRK2ZG5cz5Y2daM9FmnO8bvhKBMEoxYPWggoyt0j9Co2deXn6NhAK4PPq+?=
 =?us-ascii?Q?ug1+MBRa4AxHrLkkaoZTFca1g8dExfBfNjQdEAngNd3z047aRWe/qzbiZyjQ?=
 =?us-ascii?Q?u79i0ePewlhJYTYJKElbpBCdhr0f5A5LbSWMcngVRmuCHRLUgdgcw+HnkerX?=
 =?us-ascii?Q?iFnzCDOsFOorSWrN5SNmFIZSjDPBPeLAEMsB+RJmukqBGr8H4un9U4ob9OUz?=
 =?us-ascii?Q?/jw1dOfH2KYE0irGarJABVhKxM1UrA38AtoFvFAZ5MxWdonDc903wNf7OVjl?=
 =?us-ascii?Q?zLOhZkglVuJMhOg/muFYXl/wcdsb6BgVgvt3B14UFYBFy1MWscoh91cyO5Ra?=
 =?us-ascii?Q?IoP598f9csjRIkIYBQa+pYwYXlvBArw+rIcYVIkOEHqcBaLA3zS1E4DdZLlR?=
 =?us-ascii?Q?axdQdbui0wXOsQUIgiy+EOoJXdBOwstz1I+jgkSHiPlCnwu0jMRpEP1KNqlR?=
 =?us-ascii?Q?MzCav7OaXO/67gPiJEAQX+AwIrAtNLBF5/NH1Y/fCOi2DZqH15lgCf6wrLLo?=
 =?us-ascii?Q?h80L+6g/5xGfotM3ISJ6iAKclBH60ZFhfwhGh8hkZ8DFdu+rBtXY3c98xgaG?=
 =?us-ascii?Q?WbZfZwJ70vz+F/njS5c4TAM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f5aa4ca-9cf1-48ed-5a1f-08ddf59fd74b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 04:08:21.9796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pKTkTAu4WxA24p7jrxebIe0bg2N9VNfXFiRaHL3VJLkWYkeTaaX0bZWKX9pQLTgNn+Z3F4QMHAhzciAcyVRS8mLcJ/HXS+NCGoP/DN37Si9jznTEm8PbOhVclCJ4CP9Y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14398


Hi Marc

> > +		/*
> > +		 * The ARM GIC-720AE - View 1
> > +		 *
> > +		 * see
> > +		 *	r19uh0244ej0052-r-carx5h.pdf
> > +		 *	- attachments: 002_R-CarX5H_Address_Map_r0p51.xlsx
> > +		 *	 - sheet [RT]
> > +		 *	  - line 619
> 
> Are these documents publicly available? If not, I don't think this
> helps much.

You can get it if you are Renesas R-Car Consortium member.
And, the datasheet is very complex, I don't think people can find it by
himself without any hint.

> > +		 */
> > +		gic: interrupt-controller@39000000 {
> > +			compatible = "arm,gic-v3";
> > +			#interrupt-cells = <3>;
> > +			#address-cells = <0>;
> > +			interrupt-controller;
> > +			reg = <0 0x39000000 0 0x20000>, // GICD
> > +			      <0 0x39080000 0 0x40000>; // GICR
> 
> In v2, you indicated that your GIC was configured for GICv4.1, which
> implied 256kB frames for each redistributor. Here, you have either
> just enough space for 32 RDs for a GICv3, or 16 RDs for GICv4.
> 
> So either this is wrong, and you're missing half of the RD space, or
> v2 was wrong. Which one is it?

will fix in v4

> > +			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> 
> No ITS? That seems... surprising.

Will be added later

> > +	timer {
> > +		compatible = "arm,armv8-timer";
> > +		interrupts-extended = <&gic GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
> > +				      <&gic GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
> > +				      <&gic GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
> > +				      <&gic GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>,
> > +				      <&gic GIC_PPI 12 IRQ_TYPE_LEVEL_LOW>;
> > +		interrupt-names = "sec-phys", "phys", "virt", "hyp-phys",
> > +				  "hyp-virt";
> > +	};
> 
> Why use interrupts-extended here? Everywhere else, you're using the
> basic interrupt specifier. Can't you move the interrupt-parent
> property to the top and simplify the timer (and everything else
> outside of the 'soc' node?

Will do in v4

Thank you for your help !!

Best regards
---
Kuninori Morimoto

