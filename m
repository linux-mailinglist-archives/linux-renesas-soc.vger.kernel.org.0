Return-Path: <linux-renesas-soc+bounces-31341-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id W/vUMQGC4WlmuAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31341-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2026 02:42:41 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 247B1415D2D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2026 02:42:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 58EE33035AA3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2026 00:42:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAFA11E1DE5;
	Fri, 17 Apr 2026 00:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="EmefK9ap"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010017.outbound.protection.outlook.com [52.101.228.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8F470818;
	Fri, 17 Apr 2026 00:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776386558; cv=fail; b=hvgM5IO/e5+4nLvOvZZnjpbAfE28aAigOjSh2RIUpUoRHjTc/TrnnTPFQs+RqEkJgm2eKeI1z5HzJrxwBHbC5NbjKOwbEA+SgZ5IggSYp8qBzLodPfwRxg3SeNHARz9zTsP4iWtnCC9C4PtDODTOZ4lbYwRZ3kShFnYyOQGcH3U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776386558; c=relaxed/simple;
	bh=hoDXUaun5YYmtLOswXHQt4f7WAVFelQsCjHK1xfYCFA=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=BXhk5R45raql2wJSKLSsA2rJlJLzFTL+GZQ14Ejfobdw0uzAeuL5VYu9f8uk3EOIncVM2U2U5VVQllShsfdFIpRBpqZzoa4oinKFqFC6Tu0ss7AhCcT1leJM8zcoaIeF25nSIaCud0JlPLLutQo/w4O9//den1Hrwks0zDfjgPg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=EmefK9ap; arc=fail smtp.client-ip=52.101.228.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U2Wu97lNe6DGWW6ppRPhxHkBxMIpI2IUpSVgUf+f3S+fCwjH1D+HdYshaSwECjFYokP2H/ze2oQoa/rpQW0nT918ywo5fQ6pHqSVWN87+LZLFLO0BGHp1Lb2ErM9FXbyWGR1BdxNIFavAAjM16fUNiXknyYbg3X0wkxC40XG0cS5BcaEoNLIaebu3UetmEhOTojQxPOO7xQKwa6BvDj0jskFVmWvjy3FkHM9eFQ++JxXA7VgYRbVSdaRPlPKUYEm8RQ40Y9ErYrIiTB7jxC/j5yKShGWw2OQjwttjYOm7oUNu/wejCP7BGmqv/+AfQT7g7ukuTE0fVWWDAKxUFniJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hoDXUaun5YYmtLOswXHQt4f7WAVFelQsCjHK1xfYCFA=;
 b=ZAbTVJqhEx94BHdGc91bH6WD2Mi3iuXsopI0NT+UkpgWmp9qtKov4P8gggdpVfgjDSrM2cUFeVF4UZp1Hj6rkVOh8Wt4TYHiUBxUHr6807keBu8BdojnhdCaic77QEw2PAoTpfqNvu2itDte/2q1CbR8SWfhRCEIidBp6SgMTe5WLXhiPCUVw4TPmSUHw/4haqHk8w6gY/ukf6RLKKslieCShfwQpXnJV21vc3F3zQ3mmUAYscFeooY4GnJWp/E2eKBfKme07eDm/F2XqdkwNvc7gx0BDCUyBTVkFU492EwqA6VXp9DLH+rBDwPD4C2MmyRmxxBX5UxcdSZlkGzveA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hoDXUaun5YYmtLOswXHQt4f7WAVFelQsCjHK1xfYCFA=;
 b=EmefK9aptX80sS47Wq6EBNp6uH5menZD9uD+3pZumJCglv2hTEz9l4l1+p0VF2pxNyjzWFiJlItsl/coMZKoW3b1dohLZnChMuxVdoJbfjOkzTjFaVh1hM4GLvXU/ogJ0mgQSwcgCcfXc/ffCXVmaEZAUpZHaEldqrt0RHN9pmU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYCPR01MB7138.jpnprd01.prod.outlook.com (2603:1096:400:c1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 00:42:34 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 00:42:33 +0000
Message-ID: <87pl3yzabq.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: broonie@kernel.org,
	lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/6] ASoC: renesas: fsi: Fix hang by enabling SPU clock
In-Reply-To: <CAABR9nFN9C4CGsaZoWzrHEjibBLqQ1KmM8o5oG2-pSMcrgMsAw@mail.gmail.com>
References: <20260413100700.30995-1-phucduc.bui@gmail.com>
	<20260413100700.30995-3-phucduc.bui@gmail.com>
	<87tstepes7.wl-kuninori.morimoto.gx@renesas.com>
	<CAABR9nFN9C4CGsaZoWzrHEjibBLqQ1KmM8o5oG2-pSMcrgMsAw@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=ISO-8859-7
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Apr 2026 00:42:33 +0000
X-ClientProxiedBy: TYCP301CA0086.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::12) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYCPR01MB7138:EE_
X-MS-Office365-Filtering-Correlation-Id: 56de1558-256a-492f-6672-08de9c1a36e3
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	9OA+qntI95shgA8lb8S7nqyyspWU8P9ygQ2VrJmPDImclkk3v3L1NFQdC55wOCfjdxqFXnOjVXSmiSFy4LNNDwyzEBqcqGLjAcMI130qwRQcXsE+AgER0GzRQZVbczVC+x21sWYFmFh4/LOqZHQ2+AbPU07SsJ90TFZrSoS9NJpGlwnw4ReqUEhyzTRyrgZ4ipLyE06S4AuMmuFkeo6YWmk2rCy+k9X/tb5gMIO0iot3RBnSd4/QojFlRIMh0zDvKGsm+IlmjpQUReYZouOLm0tUXhXU0IktCXd1/cOvnsMZuxp7tO0wbB/4lrhJ+Fw/Rup1sNZH09+8wyAdHKeEvk0ItgXGH6rsD2aMQ+eldi+HiiUHLDe5Ay+8sPNcA+psdSAwUjMVAEa/pdR9pmsvU0YCIV5dD/AxN56tg65gHg9lhrImnNPApZcpHlNa/+oQHiqpySbKwnHrLDbM1yWZV7HGoDL0nroRBmdqlWdFpeVPz/Jf5GqSUHHv2ekj9BfSLnhk7PcRgZjDljn0FS1uYZZfvCy1/OG4TGKtztgPPKS3gor5k+ESA0VTPWEKbbWMZH6VxuO298rlx+2SNw0vviNY2XjhMH1Gz2LDTi3IBnieeLWqq9DoDD8TKTea9dtkC6yLU1q9wsaxwFNsZGF30QDEU6H7N4vUcmn0u+JvNw7HZZJXuq9+y6E5eF5JzSTNmMqS7IXNjxDpKnNzaynndCQDxnLy2Ypj+b0oV6huRvG+78gBbrpMaGCRgUgcLFeB8LrjYK2pftz92/s6fkPVQWyjWvVp1aE5joGD394/UA0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-7?Q?0j83robqT/ab4tuF7msNfbOjuDwgGr3au476IauEyxhVSGMfgmF+jobYEG?=
 =?iso-8859-7?Q?IInKbsriglGu0H8NZFG6Iq0j3/fUPfGKJQiwcw2OS5PZvWxlETS6ZI+YFk?=
 =?iso-8859-7?Q?YDYqw95Q8oK9GFbaitOZ3DVagw44GNnMd6v3gIM/cAqvz/2tUBkoOn6dnV?=
 =?iso-8859-7?Q?EJ+0bjC5h9vW0QOGVfrlkMVT6BwL2m+5v6ckMkQbltmNuykdOe1TizKHyd?=
 =?iso-8859-7?Q?Qji6yGixVBC/X2B7F3yDtbh/uPwy6KTtwSXATyWdYtzEFJseyYoGKDyI3a?=
 =?iso-8859-7?Q?s5QVZ1VjvkuhIVsyXz+jivWra5hdQz1d2G1GcXXSQKAWV2sxt31Q/Q4yCs?=
 =?iso-8859-7?Q?Az0dhdU4uGONTXdk2Uyw1NJBl45YzNaU1X7k70wokEgKrkFr7oFVlj8evb?=
 =?iso-8859-7?Q?mBbLznE5thb41JK87+qqpXaUV9XMHuEJJEW9SdbjEfu+dN0lflxCNlUeF/?=
 =?iso-8859-7?Q?RnZf0iCIegL9pJgW3sKYu0XStRFHQ1H/QLlC/yR31n9Svpo2BezludWk2O?=
 =?iso-8859-7?Q?F8dT1M7vJsotH1Xapi5XOeKTaohgt4vlx8ARPtTBLvYukIrmoZl0LuNoIR?=
 =?iso-8859-7?Q?jKfqMqE4qm4aadi8Dg9o3m3lNOqaB7uSu/k/JtIZbYuUcl4g7WO/aO/GNp?=
 =?iso-8859-7?Q?LiDpHvBLCMoGdg619pufi8QdJI9hYYYUEYb8J5/pylRq2KQii1hIfBMFEb?=
 =?iso-8859-7?Q?XSmaSbDjvgROyhuXSo6jG2dgaZrMqFUMdz0XJEuVu/7e+k5qarkZ5RvdML?=
 =?iso-8859-7?Q?/VbgQyy3JKy16KYlX5P016xZaK5qKnwY0Rae24bEJPlvW9kU8mDJQqF85e?=
 =?iso-8859-7?Q?uLX07Ip7nq2DPFntxJA4g++lj4gFGzkSevpXfXRe4HXyvixed1q15h2UN1?=
 =?iso-8859-7?Q?FtseVvCWCM77e1+cH/3aL2VlHBKsjndvnLdJB1koe5zLj+PCelO6natJie?=
 =?iso-8859-7?Q?N/SmLGNUy830X0cnB0LRVNTUGrw9kjmm5zljGUSUcjMrwYonLzAjJTKegJ?=
 =?iso-8859-7?Q?zb2kta/2srLOsrzX2XaLP7kW7IvU8Wsw8DsDvIhhi4vKm1Pu2MB3Yj+vt1?=
 =?iso-8859-7?Q?MK2bnZ5NOSwEL1V6CyQNu/xu/SKHM29nQxPJiIZRDmeIeqYT/XdJKH5rsP?=
 =?iso-8859-7?Q?KZnIn3SFIbt8w71yj+Sl5+ojHyVDuB6NwS//EAmr6MAgcdVPsXCKBAp8JG?=
 =?iso-8859-7?Q?QGCRcdXcPxzUevEVkYWyQ/by3tETXnxb8Bk6fKg5zB11mH7XZchvqjkLGO?=
 =?iso-8859-7?Q?tcQFsO6jJeC0sLhA9mPoOw2RreiM1FfpQU2umnS8al+2XGyqtce4q+g5s0?=
 =?iso-8859-7?Q?U1CyvmQ5aW4nS14s0ElE/26CvCG74zRPAh0dLqvX0flVkKxv5YfEAyIZSx?=
 =?iso-8859-7?Q?r0P3GN8/L3uy0EvlWh6ZM7/7RZvoWh4+ck++oHJWTWqOdLojnGnqgW2YWm?=
 =?iso-8859-7?Q?w8PtpGb4Qan1s5+CNkypvgLHb5iIo5i2N0Pc13VB8MgyWoTbY1uD1bFh0v?=
 =?iso-8859-7?Q?AcOBkeeI9SLJ1iB1Klxw2zbx+ejIqM1E81hG5w1xcB03nrz6+KLbonsUzV?=
 =?iso-8859-7?Q?yzyujmQpFc7Scm7nQBVOeoUezjXv5LgtsOvIlZ1pOnGLq/O3th69bIj9Nn?=
 =?iso-8859-7?Q?NHf/v0fpD5Qp5x/6o2Us2GRa36R3hXqbfKoLhyMnUN2qDX3ueEp6oga7S5?=
 =?iso-8859-7?Q?A8xLTfeDq7TgUR6IZWAFHCsgvjbpOJA5CXUxkU8IHDuRc5gD+eojtXNZ0n?=
 =?iso-8859-7?Q?bCO/qePwKXRvJH4huJvnL6GYR9xF2kJ/BKEN9GPi2OF50x29u9iZLV79DE?=
 =?iso-8859-7?Q?cglX9jW88B5OwsWX/7MgxUPMzLJQeJ00Kv964zBWsBikyEFwMiM3?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56de1558-256a-492f-6672-08de9c1a36e3
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 00:42:33.8583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OBKG/83KKoPMarD5c7OGv5HlFHK7ZNz7tWgW2XQk153i2AalxsTYIi6Hg6YkZuqC5wAy55MeSt2xhkcR2dLEgUJohWso0rq/0c6j74O1FS0kNVVO75EB/1HhyOR5Pbf0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7138
X-Spamd-Result: default: False [2.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31341-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,glider.be,perex.cz,suse.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuninori.morimoto.gx@renesas.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 247B1415D2D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


Hi Bui

> Regarding spu_count, I=A2m not entirely sure, but if we increment it
> even on failure,
> the counter might become unbalanced and clk_prepare_enable() may not
> be retried on the next call.
> Would it be better to increment spu_count only on success to keep the
> state consistent?

It depens on how you create the error case :)
I don't mind super much about detail of it.

> Since fsi_hw_startup() and fsi_hw_shutdown() are called from fsi_dai_trig=
ger(),
> I think this runs in an atomic context, but please correct me if I'm wron=
g.
> If so, is it safe to call clk_prepare_enable() under guard(spinlock_irqsa=
ve)?
> Since clk_prepare() can sleep, I=A2m wondering if this could potentially
> cause a "scheduling while atomic" issue.
>
> Would it make more sense to move clk_prepare() to init time (in new
> fsi_clk_init() ),
> and only use clk_enable() / clk_disable() in the trigger path?

I don't remember detail of SH-Mobile clock driver, but yes.

Thank you for your help !!

Best regards
---
Kuninori Morimoto

