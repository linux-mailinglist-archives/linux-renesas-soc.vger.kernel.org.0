Return-Path: <linux-renesas-soc+bounces-13007-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E437A2F05A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Feb 2025 15:54:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D45A161E7F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Feb 2025 14:54:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08C41222566;
	Mon, 10 Feb 2025 14:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="a9TFzxva"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011069.outbound.protection.outlook.com [52.101.125.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417431F8BDE
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Feb 2025 14:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739199223; cv=fail; b=Q+mdQapo6wrn0sJ8QSQVEY/pNVXAPFmPlZP7sQxLfzIJBE3SVamVEo+P4uzOkw1PxAjOLNiIXfICJmaStagS1dqy6PkuWsT+D/b9fZ7MSxaCBzFK2NrBscPcosmNAz+Ucl3bx4p95i7RHxdpdMbT1GcNZjiQcmiShsryiiCtvOc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739199223; c=relaxed/simple;
	bh=yX2pvWhdsDsbeO5VxNJ0P1krTfE7jPzO2A/J8JETM+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hLgcog5vmwAXwe1BjAsDlZZ1L/pTwq2j0jJlpZa7hpwXiu23r7e4+9cK8uqWxOxuPZRH6lTxpf/YCZTT33GS6Few9puZ0C4ASe/vhYt06q/oOX+LSbdLpNAd2QAKK1Jgtu65BoTKKt7pUaLaZLnMxqXrDSxWkUX15NbWMbh9+Ls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=a9TFzxva; arc=fail smtp.client-ip=52.101.125.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ktqGZANsvK1W2NuF/0JV4MpDxOHVIifdtJsQSkG3F8mJNXDApDzMj0OmjEOgoK89CVDl0tQyMwmGQjKo017Hfs1r7HfosK7ryBEj5k9n5DolatLKKxK+/V7V5cJ7gp8HVtU/JqGMwDr2zzx/fiokQEhIZbdcSzSafkzjV9e4ioe7nfGLrzhbmv/kaync8fNdQE92cgXSvFRpxb946/KPbpGpStpRNp65SM8nrwWmkybD48X6ozSuiUTJgDP3T1M6Lwq1u+95cWv/ekpQs67LJVcTgKaDp1f9v5v3+JOhuYO1JskU69L3D6N7p+3lu7Mq58v5As/8L77pUSj9soTGUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=58rHQEq+/F7833won/4s1t4azLbZ+nV3+cAUid5BPhI=;
 b=IpZkNuLrH+s5XHa4eNsgqmQxfYr6DZMxuUvda3P4l0Hop2QjTBuevdpumpsAap9GyLBKiMUoeKy8cxDckxxjat5Ic0lOXGKNACPGQIkYozWNqu2N8R7Vj3AvhyFDuDnP/xVSFZUinQxB81hLlTPnNSQDkxlKORt/JqNizWcPVdJx0mTmd/3wQ/JOfiLn5UauQds5qGH/q02d8FGUXVhVS2JALeWxqM+/emL9ARhmVJCLMOlyCNXWvCRidzvKcSaXjWOIKg4rGDkRcMSyo5VC38cDyIT1RvVFNtE8PM/VRzr0/6wn4BLQjXQyzJr4U357NEadMni9Q5xrfHOjH+aREQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=58rHQEq+/F7833won/4s1t4azLbZ+nV3+cAUid5BPhI=;
 b=a9TFzxvajPL8aDkkTbJYOxzVEiTh5RHwovfBi8lv7GQ4dbDk+dAE53sIZsMD6RTmmN2H4kLn8qQIyCWML52EBL877B+1A8J874DccMgnamMMIAxJHP8hKXLT0r8qDkSpojMSJhP1Qh9aO98FqxnVUHwwTNYr8FsFyvt7k4o0sEI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11492.jpnprd01.prod.outlook.com (2603:1096:400:37e::7)
 by TYCPR01MB10294.jpnprd01.prod.outlook.com (2603:1096:400:1d6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 14:53:38 +0000
Received: from TYCPR01MB11492.jpnprd01.prod.outlook.com
 ([fe80::4a09:638d:4f7f:51ce]) by TYCPR01MB11492.jpnprd01.prod.outlook.com
 ([fe80::4a09:638d:4f7f:51ce%4]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 14:53:38 +0000
Date: Mon, 10 Feb 2025 15:53:24 +0100
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 06/14] clk: renesas: Add support for RZ/T2H family clock
Message-ID: <Z6oSv8TDtnI5Tvye@superbuilder>
References: <20250129165122.2980-1-thierry.bultel.yh@bp.renesas.com>
 <20250129165122.2980-7-thierry.bultel.yh@bp.renesas.com>
 <CAMuHMdVUhXQ80DRbr7yFNgzmGMuDEuScZZhKihhtee1U4qP3UA@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVUhXQ80DRbr7yFNgzmGMuDEuScZZhKihhtee1U4qP3UA@mail.gmail.com>
X-ClientProxiedBy: PR0P264CA0067.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1d::31) To TYCPR01MB11492.jpnprd01.prod.outlook.com
 (2603:1096:400:37e::7)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11492:EE_|TYCPR01MB10294:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a8a501c-154e-4aca-10a2-08dd49e2b3af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+Ghp/PFE3tVeoDC8bHMNIkGTK1DgTNZ3baz7dhQG+dNt6F+5lpXSc1oYbvml?=
 =?us-ascii?Q?ftvtpH1EOV5tEooorenCBrBcpAJyTPcQ2r0Or/rOwOJ4F0Ukv1cpo2O6xstk?=
 =?us-ascii?Q?Ghl+ZLaAJZYTMjyOc81E51BBFRW/lZKh3lffpmPn8q6/ToeNeoEIVSUPUIQJ?=
 =?us-ascii?Q?tTGSxp5XOOBcW4WMgFPty0UKz4TAqKpnVky3Gokc5lN/YCoIIxhegjCCAN5G?=
 =?us-ascii?Q?3yi+trlXuSnMXb31sGqvo/IKEagPW0DTRrj1wjJVPO4FPrafgyADua7LlqBB?=
 =?us-ascii?Q?x9i4j9fHYoBai1kF+7Gq0ltpourtG+CptQ6rJRXgmA9t/LdSQGlCK3qP2y4a?=
 =?us-ascii?Q?WWmhERTu/qWdO2RRXmRUbV9nzay3AtLnR9ZGkwqt+ZCDSqVTCVzkNBEdJp1F?=
 =?us-ascii?Q?CMwvzyZ0irto8qNkreh4ndCFm0jbLYl0CvsbL6tAwk7oWA+zs0ZpA4dHOwQ/?=
 =?us-ascii?Q?od1uuPNsakqRlG0/IFhuSRXrPod1M14Gc/2sdMTWJA/HZm0rdqt2n9/7PJOM?=
 =?us-ascii?Q?N9JDAIWSDiH898NYgloN31+M3zK+H2JMzilUpSnWgH9POiu18teilPY4a5FS?=
 =?us-ascii?Q?NjStZoT9TqgVpd1CzNg+zAB8DepnirQPXETJ6cKcQ6UncKUaCPtphYBDe+vr?=
 =?us-ascii?Q?KlRF9N0H8iVeiSoqOY93GHwBA6K6HIQ5OzvctrhHifCPx1d9re7ZT6uUqmWD?=
 =?us-ascii?Q?uxp+GYoefcLMX5Rx/SHRMs56UmqA+a7cUhcqZiWFgNx+ko1Z6hv6o+qn7O8o?=
 =?us-ascii?Q?Pdfy3pe8C2lUmHQH6Rb1MepwY+bYPu+UcVNYtma51jNPMHlRsYIZpNLRwQay?=
 =?us-ascii?Q?O3+J6Kj4jYyqamMZux6ZnZ16lclY9RqCtLhJU9Fh9ZBDY4c1VRYcxbar3ue5?=
 =?us-ascii?Q?mUHOxPxFwVblL7W81YFTjTH2C4/q2nnWKFdTmCULqa4TlDbobKKR1y44efrz?=
 =?us-ascii?Q?F1wOXOnUH05y3Sj2bv80S/8tTSfABfKt4OszBBsCbdUVKs8B95uhCM5LOcfo?=
 =?us-ascii?Q?TwgCwzR6Ilc6pMUbK7mJLYJdLkt7fm44hIi8Cx4QcoCh7h/xROM/Oo2oYT1F?=
 =?us-ascii?Q?MCxqQU0sI1k7jV4WMlWhn2GihVEWuaunXRUETnHCxPId0Lc5aVQYX2MqC6RA?=
 =?us-ascii?Q?SL14NxdNXptNY7lPArJi/CIRmb9XyCs2S8vFFLaxtkR44meCHd0Db5RO1DG8?=
 =?us-ascii?Q?Iqvp1j/SmnU1vDOq8FH0Z3XfmXkYZIa0QDpmguq1TdK2n8PL3k8JMaSfsnWi?=
 =?us-ascii?Q?kfhhWvi1019c4en2H9XmPhwNkORTW0LvVl9mwgVWaXy9QHgkPwO8XEwfsTUM?=
 =?us-ascii?Q?rFIUQ+LDmy0WbZJH6QKYxaiwQ73KxpfWmUffhoQA5mMiRwMS2refUu/P/Fio?=
 =?us-ascii?Q?xa5MvMvTz+P1TdHqfN4VLTri9q2BJLADOKlfl/s/jNS15i30NXZi/vkV0TYw?=
 =?us-ascii?Q?sh+RhMrtwXsPAtoB+OaiEc6XeW+upYTc?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11492.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?58hmBk4Qpw9CV8B7t8CHfUEroHg2dIHY1lG0N9P3dfSnUiNxHXgQGoCwIv7p?=
 =?us-ascii?Q?4fRXca8t+/4ItqER2nDqpAWhEWmvTaPd/Ctg3MeFyZ1UYNwRbF/3ZW+f2K+U?=
 =?us-ascii?Q?lYlkKbf35SmroTyUt3VwTSdQWvn+Fog4lJMZvZJPELARjPbN5TpaJDT1CyhD?=
 =?us-ascii?Q?oHmhD866s/uEpvNN1fzFiCWoKU0+VYSZ0VjiTru12D1sOz2CatOm0syJVOb3?=
 =?us-ascii?Q?Pti6TG/OOG0GxhegBYgD2DlUAW7aweS2fz0Dgh9ASNRrYwj1J+sopLQ5l7Xv?=
 =?us-ascii?Q?69JUsEtmUYEJRJ5CrAhrVBTYso9fPnIn9liPCgOH+qlLLAvZp15nWAbIB33e?=
 =?us-ascii?Q?ORuvHMoUz6iQsV/p3+bzujJOHL2yg4pxqt2HJI2QaXXSBLtFXMzVa1jhLyqX?=
 =?us-ascii?Q?l/9RJYFSVujm54D6oFB/hnh1y5ObUfMwz7mWKkpkUaXNQduY9wToFgRYbOiy?=
 =?us-ascii?Q?HBjUAK2kphK+Ueq2D0wTPov/61yV5BuyAPMruviVEDKnb2rRYUHp8S3Aqjdi?=
 =?us-ascii?Q?ZqNB4Qr9Csb5F79avyXXktyKQQmr4BAbvZN07KwfHds2l6/TNekANEkTrBlT?=
 =?us-ascii?Q?F9JVk2ejVFT6m7lFSH8nMgeKxEn1la0IV+rHJtPJpppocR16ZnOOYg464K5t?=
 =?us-ascii?Q?LaFaVVnwlrJX18KQeXhBR1v4/yOflbOGLtRv2REqWOPoJaBvmnrg4e18M/5t?=
 =?us-ascii?Q?HbE33vp9p/wCR9AeHfiSN/NuRi47I/yL581EMQDPsxFBaFG6jHfJ6h+8Nnya?=
 =?us-ascii?Q?nlteh9Ms7DuyfY2kw5YsfJHoNVecRdmTvSNxD5GVVef+ZQo9sAAr6tb7RLpC?=
 =?us-ascii?Q?nIcrVXyaHQzU5jJJKiYMTdPy4iqtD1kWnCiFNMvpobQInl/mjKksXCYy07ar?=
 =?us-ascii?Q?fv69BA7ujWjQNQc0ijubOTERS4KRdQi66LaHGuozX+I0nqmx6IklS7TdvDRY?=
 =?us-ascii?Q?VL8QldcrSnuxNPio6ffs5FV3NnZtwR2HA/uyi12pe5AxZxiDu0hvzceaNoYu?=
 =?us-ascii?Q?2S8pMLhgTS+ztBOtQXQwk9kI1oeve54IV/i4rsAq/0/Anu2WWIJH4FK0s+Fe?=
 =?us-ascii?Q?hW8r5QPwfT2rJ5sSEKLBl8cDO9cxUMUhxlIv20EW/mPHA1j6n46JHK5CQsPQ?=
 =?us-ascii?Q?mharggLHBuPxAZOhBtWXwr/3MMmdZhQhWcmuhuRr4lrRDxMjRh57vHph+O7W?=
 =?us-ascii?Q?pPNg02BDIAMtqCq2kWhATPqrq++3O2BdSmxuZOWwnw4ViSk57wS3iJOlGpQC?=
 =?us-ascii?Q?RL7h4jqYik3hHpuVg5uQ90PJgpAFNfrfD5J5A0MH1464RQocJQP+yRfi8Hn4?=
 =?us-ascii?Q?g8zCojfW7Yfw2uyLv0EPVqffcmg/YihTadSAVlfPjQFGKgSj0MuxRGiE63H9?=
 =?us-ascii?Q?QCyzX10HiAoghoN+KlOBpIoNYtXp0jaiqGl+at5eauTSD2TGi4yaXyB+wfSE?=
 =?us-ascii?Q?F0swg+ke+R4guQsz7cP49QZ/F29JIiZ4b6A/BKwGtiR7cIc5nSsLuzJ/2fDi?=
 =?us-ascii?Q?3ZT43bbN5GScbnjPUwwe/R3aFAJBLubPhIuT+qLU8AGZZbzv5a2L9NNG3Hvs?=
 =?us-ascii?Q?LLGmkfdY2n3Vkm/ms5CkDCtdgM+dwCgzrDutgYS367S30iBBoIM7XIgTT9LE?=
 =?us-ascii?Q?AiCN6TzSHunnIBKWVZyCg5M=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a8a501c-154e-4aca-10a2-08dd49e2b3af
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11492.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 14:53:38.5765
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5mnmuuu0jH5x4yZHohdBKdfZ0YD6revdDpqHAtqWhFJ2hM7eQkaZ585CRhzGEJsNMYP3ysUIaBGTbu7mJLXeeq8XobYNz161rx4l/ykKRn+YpAkOeC2VkgZENAbWaMEB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10294

On Mon, Feb 10, 2025 at 03:06:29PM +0100, Geert Uytterhoeven wrote:
> Hi Thierry,
>

Hi Geert,

> On Wed, 29 Jan 2025 at 17:52, Thierry Bultel
> <thierry.bultel.yh@bp.renesas.com> wrote:
> > Add the CPG driver for T2H family.
> >
> > Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> 
> Thanks for your patch!
> 
> > --- /dev/null
> > +++ b/drivers/clk/renesas/rzt2h-cpg.c
> > @@ -0,0 +1,549 @@
> 
> > +static void __init
> > +rzt2h_cpg_register_mod_clk(const struct rzt2h_mod_clk *mod,
> > +                          const struct rzt2h_cpg_info *info,
> > +                          struct rzt2h_cpg_priv *priv)
> > +{
> > +       struct mstp_clock *clock = NULL;
> > +       struct device *dev = priv->dev;
> > +       unsigned int id = mod->id;
> > +       struct clk_init_data init;
> > +       struct clk *parent, *clk;
> > +       const char *parent_name;
> > +       unsigned int i;
> > +
> > +       WARN_DEBUG(id < priv->num_core_clks);
> > +       WARN_DEBUG(id >= priv->num_core_clks + priv->num_mod_clks);
> > +       WARN_DEBUG(mod->parent >= priv->num_core_clks + priv->num_mod_clks);
> > +       WARN_DEBUG(PTR_ERR(priv->clks[id]) != -ENOENT);
> > +
> > +       /* Skip NULLified clock */
> > +       if (!mod->name)
> > +               return;
> 
> Copied from rzg2l-cpg.c (which copied from renesas-cpg-mssr.c)?
> Do you need this?
> 
> Given RZ/T2 does not use the "write bit 16 + n when touching bit
> n"-scheme (like RZ/G2L and RZ/V2H), I am wondering if it would be easier
> to use renesas-cpg-mssr.c instead, like R-Car and RZ/A2M are doing?
> 

Because this is the early support for RZ/T2H CPG, the patch
does not show the all differences that the driver will have with
renesas-cpg-mssr.c
Taking an example, renesas-cpg-mssr.c does not seem to 
handle all the clock types (eg 	case CLK_TYPE_MUX) that RZ/T2H
uses. I am just afraid that even if renesas-cpg-mssr.c would 
eventually fit now, significant changes would be required later.
But you have a wider sight on this than me.

> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

