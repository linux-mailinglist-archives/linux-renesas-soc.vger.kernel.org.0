Return-Path: <linux-renesas-soc+bounces-24483-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA2CC502D8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Nov 2025 02:11:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D87763A97C8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Nov 2025 01:11:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D885D221FAC;
	Wed, 12 Nov 2025 01:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="dkfE8jj8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010033.outbound.protection.outlook.com [52.101.228.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857061A23A0;
	Wed, 12 Nov 2025 01:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762909886; cv=fail; b=VTKtu5YCpn1Sd8u4M49I3WCTmn8jlge/37di3VXUYQU+4wYX7nJJiG0kMzb2P317VRIlSgXJut2RGBP3dlU9dPcZ8zXotGMfDmfuhjkoyMiKNrYHUAV6Yq1gBeilMHcXiB3WqoM3FRDseW18QKzSaLcRoOT0ADp9BESyIFYNhE8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762909886; c=relaxed/simple;
	bh=62CHv2wfYLWCfeKdgI8eocceL6CN93ot8I8gA9j0caA=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=AJnpCdeaR6tGausoLWp3hARDNxpV2u0cUSMB7TPqFpZZXjY2Cq1EUaApDB8S2ir0vXruNDtwtgiFW0Gkx4WNXRnVIkwlCp1MgogFlrLE1rMNSapkPjnowZmSdebsIpXyrEF5apQEqDBj4i0cSS5T/bge04NyzXFrKhaUGuvENs4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=dkfE8jj8; arc=fail smtp.client-ip=52.101.228.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PIQ1HR80uzYk48NIDrfQarIL6A8yd4cp9BqlhwpXIFw1PvnLb2k0KIa4na+nkFOOBA1ejWNdGavd0k1pStHComgLXXRTtKr5a6Gw0ggFJDWZ4W47JLZjolv1JMbAXXZqLkvYfI0yqP1Wg9058cZeeCKCnfp0LUNyfZFuot3s79JZ87G5oEnYR/kMez+dVycE6/r2hb61xTWxa0weuEjNsvp/IcEbqN7RkpYXg8tyYwPlx8iyhcsGO4GUAhw9J1U6uZ5HHCwRxM+rGZLZa+ukhK37zC744xAXjgrL3fRgHwjgsVn1Cb9vFl+48/naHmnl6dAG3naoPMF5V6HsryqafA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wMzSZZynK55F06PuC1BbAf5rxzko1UWtsZq4wc9vMpU=;
 b=gYqvu8fnHnG7TN3lHwKsnp5qjGDHf7gTGE8X60jSyw88CD6WhMGts0LwqKQAGfy1Y5uI1bHQYtb0jWMxou+xt96swWXHejy+OnvxshfQzHbojeqUgA9JoZtClcfzwsVf+bgsTI8kIoyUGORVlaeXFUQDoQU0LtK13dKt0mmZhxZGyzu0vKPY2jUC1JFTxON7nhsXHgqHO0TKNqCaN6T+zx46fjcCYkIKkm6XS5u43mlrTK9yVWmlRsksRdoqbrCREJzJuR07Yh6MpNK+XQiyfdsuB9cMV0T60DMazEfUHoy2fNcsv5Sjqwfpoq1QcnJNRIbSNfuQldZR18VvSXCbEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wMzSZZynK55F06PuC1BbAf5rxzko1UWtsZq4wc9vMpU=;
 b=dkfE8jj8cfW6ijjzzbC75LQItMcCq7oS86lCfywXwjk2Sas2PzSserhvEH2z+yb3Vl3cHh04+X7P6qsCZc6J1rcwSs65YYGyHzXPxoJhYplzvTY1ulYisIXkURkHBZ2NeD2moxWA3ENpgeFuyMOL3rAY3MLBahqMi0Jzg1LM5hY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB15147.jpnprd01.prod.outlook.com
 (2603:1096:405:27f::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 01:11:21 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 01:11:21 +0000
Message-ID: <87h5v0xdfr.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/3] mailbox: renesas: Support MFIS mailbox driver
In-Reply-To: <CABb+yY2C32cTwh=8pFGGZijwd1KbpAA5=FfFzp_u1OOo8XPn1w@mail.gmail.com>
References: <87o6prsl2z.wl-kuninori.morimoto.gx@renesas.com>
	<87ldkvsl1k.wl-kuninori.morimoto.gx@renesas.com>
	<CABb+yY2C32cTwh=8pFGGZijwd1KbpAA5=FfFzp_u1OOo8XPn1w@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 12 Nov 2025 01:11:20 +0000
X-ClientProxiedBy: TY4P301CA0024.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2b1::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB15147:EE_
X-MS-Office365-Filtering-Correlation-Id: 192bd0bb-f3d1-4f6c-f9d4-08de218863e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?R+Da7EoFAyybOZ0G+Z+n05unIraOCnGJdZWCcNcvAsFdKweqjWR5zsjdguuD?=
 =?us-ascii?Q?dZm56oTyi6w6nuGjrpSTtDnIuB+G9CWyKvS6Fw3F9ggGggYE37qE5YTjdOP/?=
 =?us-ascii?Q?KzSwsuiT+7wuwfFPmHXCQPtmYtNnuDLrWjJ57MZ4GDdjzTWeprRxuHTz2G/i?=
 =?us-ascii?Q?JKb7Q8Tl4Hp06Jwj9gdpVP/waTPOXqOmnIZbSf+jidV/PVUDnWxfNFlk2nki?=
 =?us-ascii?Q?Ze+xYrYgH9hzkrxJfy/Jw7eJstlCRoysQLmc45ghdxbfQ8oEywwEmtDxTve0?=
 =?us-ascii?Q?MWDXO1vK+KEd5aPhkJGfo3430ZBF2gPRspgV2l2rmDie3Nhre9sxtJytaXlJ?=
 =?us-ascii?Q?WJkNnlGpCVyZUFd8M3mYALmKDXRJPiG7Ettfir5dKBlQQGYDkGNzknnopIIW?=
 =?us-ascii?Q?iblI6IoaO7NLlP/tsPM8IQFYPAObD5It7+Wfowi7cjdbQ3pahwj9YBG3qI4E?=
 =?us-ascii?Q?S84oo8TWF+ulCOmqVmWh+xSL2XygWkRvJ39M6u/fzQr578ZIa2GhDEja+xU4?=
 =?us-ascii?Q?e/PFh5W0puWGUtq02SNZgezQgvm5h3Hxwi18rXkWJWrYFRK0FnAmKBGi/RGq?=
 =?us-ascii?Q?i49XNB8ThykE7jAm+WYEgbOWYBVFoNl0yfOFhvhKEkwa6hs6OxmWik28ELlm?=
 =?us-ascii?Q?l+vR+Nhc7KfS7djKB8JQVhfx1xJtJc7V//GjRkEIT2ZdZhivj9Iv+ihYI+IC?=
 =?us-ascii?Q?bMIO5AwS6y4vw8v4x3M3Vhm3GoiNXRh+ZRcgFO7j1qMf2TYHtNMW6bF6koKx?=
 =?us-ascii?Q?n9t8v4Ww/ip14nu2zg9aSpCQkwO8Ti/zNC5QzmNtudBJCGBojb7y+4wUO5cL?=
 =?us-ascii?Q?XP08e5hqqLY1GMzsvAfN9pNnlTvnaLc/tWx661fhM9sFrQAqrvi0+F+8BP2o?=
 =?us-ascii?Q?iETxHBRwKa0Y1o81Wfnm3Wqlb3qnedlSOEw5972IQvfezQBxnsyOoWNuNllT?=
 =?us-ascii?Q?/8QBqETT8QX6LhQx1Nt9PR1/s9Z5li52IvYYEDcCwN25p56fBersTCE6XP+W?=
 =?us-ascii?Q?27HWfpBv/CbtC7fGj4ra6oCpN3sHZcwxtUaISpOXpACsQ+PMsMg3dWt5BOOC?=
 =?us-ascii?Q?d0U9Z3vg8PU/gkALgWoEf9VY4ni7yHgaH67+GfnJIhyeyR3AMMEblX4HGeho?=
 =?us-ascii?Q?GMf6ED/Hocw95wur/dVEwl3bNlDslLfElD7NVcocNbr9x+9DTzZSW3em/Bzv?=
 =?us-ascii?Q?5Hf0h43xHAp2DvqQRmOG6OT8Rmqucsikla+5+JgjL6Ucj801r/OmIa0hISwo?=
 =?us-ascii?Q?fLDG0tYIFhQUb8ml6eJ9mcyLste8kqoBsj50XcPI/OA5NqWd3VkSz09WFiDD?=
 =?us-ascii?Q?nDJk/Gt5eQ/rG8wkaXlQk8zUl6e6NEac/HY/uGMA2mVzHTcYeDZhh642FYH0?=
 =?us-ascii?Q?TdAZTeN4CsAVkMJhLtBs96JEVMvZW3UrXMO6Xmie//mVn0sV8EApg0sEt62Q?=
 =?us-ascii?Q?5YCIHIRYxuEBqxkKlmVfAyAS5WLZYhbjrQUE7eZe9+wdLL1SMpUfMQ59nrGK?=
 =?us-ascii?Q?XFNI8XhGRd697KLy0Ub15aI9AT6j8suGHg4P?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Mv9ilOwfmT5jDlErBJWght2+mHk5RamzW8LBdhSCY4qWH8NC6GoteuRGNx3l?=
 =?us-ascii?Q?tYt7Ly+m/pI/RzzVAJV+Z/lySn9cGLyr7EclujVAOVJ/NgGQk8+v0+OsJUeb?=
 =?us-ascii?Q?XSs/uYk08qP4eEdyjFU6rTVUkAQ99ImlQlVk1qpsaksOXpjNDO+2W3vrjkEe?=
 =?us-ascii?Q?bhhk2VaH2JeKN5tKzSgk+zU/Df765ljZxy4U+z8BUvsicG8x4i332B2UBapB?=
 =?us-ascii?Q?NZlODgwCb/tjgfPHtT/QOjIjCXfWZFryZAOD+uA7+r5q1g03VLNJUlYNxCMa?=
 =?us-ascii?Q?BPWyZAuMyiiqYY0vZ1PN3/uHqr1IrGqHjIq5l7X7udYeRAUG+degqznpLiAI?=
 =?us-ascii?Q?taHPcUAYvQ5Q51o6V5qCMuW8qLMkFLdDSE0TLXE7XjM1IfcXwvXeD2AAVQWi?=
 =?us-ascii?Q?6hMpP9265pg0dOH2gHRCRGmABMmzu6cLfx9WeU49oVMq70+WufQg9Lm5Zn4g?=
 =?us-ascii?Q?oqdcZs9SOa85gcxEn4cx7BTlyGH48lsQE8Iq35oYQ9V1HlX+og3vAsgUPleJ?=
 =?us-ascii?Q?26QSYF0u3Vb7+Jiyv1mev+4k5wzZWTRVkx4bRcqG+3/uIPVCWFX/ZaLEwsHz?=
 =?us-ascii?Q?jaigzZlu5JLUxq3Ic5st3vO98Vregj3yBAJnzzLEu8v/xk4HQXvtOTkx14px?=
 =?us-ascii?Q?D7a+IGaiZgbfMScFSyjjCOEraD97gxW5LS4ajjhkmsYBzrjio6ZOWx/F7II1?=
 =?us-ascii?Q?KG2t2Bj11W9b+hT7gHLBg4RQKSHBZl7725PP1iLeeWkoT2BL5E/GQka5Vwuv?=
 =?us-ascii?Q?KNoOEIPRIOW96OAjkG4700AvUMd86zSid2Ydwmy6IXIcjvgxkJI/KlVQzQyv?=
 =?us-ascii?Q?KyrFQmYaoarbBJPFpkmbOdwUQXwFEGL4jF7bEaDJ4PBUOPCzhL/GWXYP6+HM?=
 =?us-ascii?Q?CRw0C19sOIH1OCMLrF6OhIqn64agrZR8R1p/3mSVWru2Law//ZP32S+y8F52?=
 =?us-ascii?Q?TW6woStNjsyVDVSgaEPpIPKevw3nhii69U7O2wjRBXWjI65vHM1jOAYe2B7V?=
 =?us-ascii?Q?vnllIFIvmjzYbxeBBTNHgf7hE5U0O4HniP60IMBZK77kQjcJY8l4eNc+QJXQ?=
 =?us-ascii?Q?4utvjAPWz42f8fu+8x46fynhwqRR8ZSUa7kMDRastYOzz+IDfcMhQR4UUOXk?=
 =?us-ascii?Q?+7QAh8dL4/2fdDCpMZ1eeucsRhmS/Sz10lSdlbt6bPoPH3gcGvAOOaEGEeDk?=
 =?us-ascii?Q?H3SYAG/s3v78aOnzwbINvShpVA+Ef+mTYesPQXGEAVO920ZR/1qQOKGf1vba?=
 =?us-ascii?Q?DW4lf75c1qURvuqDxBhD+rybnMBbeHtPR4wzhDFt85O8lnZhlQZTbo6lfedx?=
 =?us-ascii?Q?btweAH0unc14wbl4aAxgJFbwzQJHemHiANiK1jEUO133tu83J8tjV/+GwXUq?=
 =?us-ascii?Q?tEYOqhFNYJfEdDcUJmBPgATnA1VK6PFK4QNQhI0bzjK1j1893fbRUxCSCu9H?=
 =?us-ascii?Q?ne5hTen2wkvUKa143cz90quwtVZiYquyCX54kAB/J9bpCVmZRR30Rjn2Tx92?=
 =?us-ascii?Q?SlycBGdm0DjE38a3mGq/NUI7oT/asYW5SmPYkv9dMXz7ToDts4nN66tJWraN?=
 =?us-ascii?Q?IC0EdmJsScANJT8VN4E+GI9Ozb9xG6G53NSSYUgAFVATAwqM6wrCE/7YmFRE?=
 =?us-ascii?Q?om2YxCfYJ4uf/BOe8m6gZgk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 192bd0bb-f3d1-4f6c-f9d4-08de218863e9
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 01:11:21.0743
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5MbLwmoMXaby3O9AUycGITTgrDE/m34Oz07Q8aFDiDDjcE4fkTY8ZoODfnabggsDVhBw+dzQTSfUvFMSq5Zpzw8JkyFCPGs+4qvwsQ82vULNTnNOFw0j+IpyAF51ew+F
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB15147


Hi Jassi

Thank you for your review.

> > +       mbox->chans                     = priv->chan;
> > +       mbox->chans[TX].mbox            =
> > +       mbox->chans[RX].mbox            = mbox;
> > +       mbox->chans[TX].con_priv        =
> > +       mbox->chans[RX].con_priv        = priv;
> > +       mbox->txdone_poll               = true;
> > +       mbox->txdone_irq                = false;
> > +       mbox->txpoll_period             = 1;
> > +       mbox->num_chans                 = NUM_DIRECTION;
> > +       mbox->ops                       = &mfis_chan_ops;
> > +       mbox->dev                       = dev;
> > +
> Please fix whitespaces, here and elsewhere.

This is for cosmetic, but not for technical.
I know many opinions exist to this kind of topics, but I like aligned code
because it is easy to read, and is also easy to notice some issue if exist
in such code.

Thank you for your help !!

Best regards
---
Kuninori Morimoto

