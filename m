Return-Path: <linux-renesas-soc+bounces-26175-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 68971CE8FF4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Dec 2025 09:20:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9D82E300F595
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Dec 2025 08:20:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 209C72EB5AF;
	Tue, 30 Dec 2025 08:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="JPct1IMC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010039.outbound.protection.outlook.com [52.101.229.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0805C1F30BB;
	Tue, 30 Dec 2025 08:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767082820; cv=fail; b=n4Tv/hRFrwYHwtbHRvt0V881LHkGTArJpr61FQehbxS9f57P9JvAekh47D2dHIk9/xCCqpb2SZgRvQmJXJKU5m+4BU6gf9bGRCYoP/8c8fivps8UZR2aW+pkgcpDlk6e9JNxZyF421kyxcle6a8vQSET0k62yTYQrqyWxBzEnrI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767082820; c=relaxed/simple;
	bh=xK6kA6uLpFoJwHz7temqkUvbvjRw+C4nKQfxCjEre3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eOCSpIIc7GCayvU5pDeBdyyLAQU07X+UNPj0LpvnJNHyfsyMBH68ATCHF05nMpHh+ohLP6vfCS5ZB051N45HGg0mO66/+GoHGWx1iPf9nmtttr2JcmwLJv8sqDtfwnm+t3cKWmpZQrEPzD7nfawOOZbGuGBqs0qgjxNed+NDkyQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=JPct1IMC; arc=fail smtp.client-ip=52.101.229.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=to7A7tcKZO0oI1kvbQhTR9erNaZELxL/5LcJ8unVEd7Z9n7V88P38qNQZSqPQqVpR0v7f5whp9ekL+dH/cMJjIsT0thKFTDa3HSdTj02WZrnQDkhxAt0MHsdu+tu2QyIN4SDyWw5WosvVZroLGu0pOMOoMBHq1q280TH2YBUoI9fkmbtBqCWn7I0Qdyz7pRiIItw/eikaDSHu3eFDMX9FK57acQmZ707yZRrpITZOmhbGPS0rSoyLR9j+qNGQSOQfGtNf9lYzA1k2E44r6m5iroBD3ZjHDLLwFDykmdlnij3+L+8GpOd2ZGy9S5wTxEz9CORQNXZ+GehLpUOQWTU0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Z3i+ujzmhBvTI/+S7H26E66Q0ckW1TK/nQ2H6f2YUw=;
 b=Js9JplLJitvKJEbtzokC/d4wrUTGPZX/wQ3Ls0JXSXJSjLHeU4a/5pJ00gT1s24kw6s2pExUQp3O2qqgkSQGKE6nKBNYfxvAoKckJfYUX3EE3sXFaEggZG7/GLqs6F6Fbq7nv35fVzP+uz4PX+pO8ivaG80UETEtc2DywoOjA9AgNcxQwqSY+D/VB962f8MUr62VDyknuLuAM7kRZU4pZYjqEChqX/QXSKA6dv7nsmQS6ykhyXUrfbjaDY6nHBrQzkooRg2sBhgATPDJ3vSRc6KAEI5Bw9s8gupxx0eYZ1brVj79EJuYsfoRInhSFx+B3at+OAFgUYFdoprE3BKNAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Z3i+ujzmhBvTI/+S7H26E66Q0ckW1TK/nQ2H6f2YUw=;
 b=JPct1IMCD2h+lKsYix2kIR3Ze16Ydm3ZAXYDSx51R8L/4StuEiTeC9vR6Dba3Qx9A0vGewONfoMQocb9iWL0ujbNxMYNmOCtaHTOzyPD7NIa1tdxxQcUsEvZeczV/z/CtN1X4GNxmsKWZWi5eDtnSRqXYcYqH/uRx+EMvtAQfTY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYWPR01MB11943.jpnprd01.prod.outlook.com (2603:1096:400:3fe::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 30 Dec
 2025 08:20:12 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9478.004; Tue, 30 Dec 2025
 08:20:09 +0000
Date: Tue, 30 Dec 2025 09:19:55 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Frank Li <Frank.li@nxp.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com, wsa+renesas@sang-engineering.com,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: renesas: Add suspend/resume support
Message-ID: <aVOLK9AU4Zma69VF@tom-desktop>
References: <20251223165409.746777-1-tommaso.merciai.xr@bp.renesas.com>
 <aVKjbYTLcptpERZW@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aVKjbYTLcptpERZW@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: FR3P281CA0147.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::10) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYWPR01MB11943:EE_
X-MS-Office365-Filtering-Correlation-Id: 040b7df8-4ffe-4155-20dd-08de477c3ed8
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JSGEllzI/9zebKOvSOGg5D69On/En3F2VFTHxPBDOvkIy3SBLKhuGEQzbhfn?=
 =?us-ascii?Q?kzJGs6TokcM6zXHVVDVu6kmsOw8yBFfneYweQm/LgpnYX9SVFia1w4qLensM?=
 =?us-ascii?Q?zR9ONCpB7wcKcIr6t9U1c/6hKgim9xPc+5xODEKSxuQe53sJKT7Vji8dKCy0?=
 =?us-ascii?Q?U9dMyjhrEgpZv6udQtHTvNuCU7xcSjd2KG24lCSThaSd1jZIRA/qaS5mGTD4?=
 =?us-ascii?Q?JQCHgTQHqs3yzU3R2P25mcYR2zmI6C35v1/JkcaWE/BHN9p1zxtxIDgUsfbb?=
 =?us-ascii?Q?4TCTtVO4lBpbNeq8jcEsSFJvPEmSviDd7O6zBcBG2Ocam8lZ1oslk+tc45Ux?=
 =?us-ascii?Q?hgIie1sOC53zR4oeCGTSM8REwkdIGNgBxyX4lJX6ayYN2ephVunjDGow+b7M?=
 =?us-ascii?Q?IrcbuPJlTgcC6jddbFxSY9pmQlz8Pn4lRwfdZKB4mPr+/Q8LMWU7rrsBPWzh?=
 =?us-ascii?Q?i+WBA4CGqFmsvlPMZbjyGa8uTPOgKhYRzH7wvv/ozF5ely/Iy8xOWH8Kc/32?=
 =?us-ascii?Q?/Qhi0trHOPAjnxOLTpr3nsgwEZaAUw3sKSq9xIB6dhAanedeYb5y3PAuFf1+?=
 =?us-ascii?Q?FBHLZykazYWxV9c1dPDY5ihieeWzi9KvYiolDjJ4PIFZKX5AMJYz/jeFscz7?=
 =?us-ascii?Q?2NCKVRsAnnnFpc78310B04OHAsjigsdsOhTZAazbs5a32c6OSSjKZBKjjeiW?=
 =?us-ascii?Q?paEHAWa97T9kZaJhhdBvKCLILZVjHncSITfxSMLvItIOUAngaBbl06o0TuxL?=
 =?us-ascii?Q?sa7bbPiBU39X0DIPUPCt9xrD5ACqbMDdc4PUt8UMMDKNzdh7YWEzy1JyN6cB?=
 =?us-ascii?Q?CrcaLw6OA8Q03pd/CVxwXsEaitin54RdqxDW/S/ulvSFRa7Y3L5kqHXtN567?=
 =?us-ascii?Q?4+qp/lbAiDB8LDMIwkyij/3sGH6XDWE5Wpex5jiIazvQWnAyuPYQWgUXeeAn?=
 =?us-ascii?Q?ACESUvp2PhxC6CV2wCdvbkMi9MdL7ZCQP9N7X9R24POGhSiXZfd+DWnSPimB?=
 =?us-ascii?Q?zkOyyRRQ9kveQ8YWXLcHN9P5rejxJg6fkGxhGvwI0+jqh7EdYQAh130OJEyF?=
 =?us-ascii?Q?2ejk3OBBXtjXiK80auEFdex5ifcX95PRRnbDKzM7cP/212bQRg+mZEFF6Ouu?=
 =?us-ascii?Q?GgrretqzwHFGlhVpCvQH51F1GR/7y2htOiVoFhoxdlAPtpWpRWLEoC9s+dyZ?=
 =?us-ascii?Q?hept3xWyoKFrmLtHWQ4dttYPAhnLcmn7a+K12xFrURfoOPy9IG2Abiw44hJN?=
 =?us-ascii?Q?31aDsW1CHL0r0to7V93GW6PCAUnM5AsvsZrgXHNia+61xvEqwSIkTwbAcWyD?=
 =?us-ascii?Q?InYxWUGJ1FN21bqLTXQiEpM0EMneDhPbAi0u21WRnAglA7FsTn9m9Yxh2Amp?=
 =?us-ascii?Q?Nk3MHv4UPlpJQI46PByEoroC23shvE2c8Mpcvv+1GLbW/CL+8Kn/8t563XTo?=
 =?us-ascii?Q?gY1VMvPs36xGREtlnHzm4jnrCrYuApy3Pn9aP/ImJFZEqqZS3gyOvD9pnhj+?=
 =?us-ascii?Q?j9AygYWh0sGJafGuDAt1NT8aufs56PqrrJ/Z?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/0KwOAwndlYCq1lRfjP9xFblzRx68dMnBK4qe6QA7lvcF+vbGaLgjo0zjcuN?=
 =?us-ascii?Q?ZOePYUC4W/yo2W+vQezrlWpa7atkycn2P3wO5HpzBZpWvCT6zZglGCkrJpw8?=
 =?us-ascii?Q?S4ZLQfq/+Pa7uPWtFsPh9OtvwWWcxZthymtS2h5Fb38PiT/2kq1ZX6A6HGLS?=
 =?us-ascii?Q?e4NpSaFN16xNMqp/bRqjG80yO5R8cVb+A89oorGPuLSrIf677wDaLjGGMmm/?=
 =?us-ascii?Q?i7OYf6DXYRm1cn0lEkwZDdnL+kuRdvqzRlgsPCL+BL/vLvtqWbyiWvzhtuvN?=
 =?us-ascii?Q?ghMZ6Jy0XW5IrayR3u56falhwrVkxn9hqXNZMkVvOf73ZTECSyir7mSG5TXI?=
 =?us-ascii?Q?c/XzKWEYzoV2qxIj5Zi20I4y/7C5rB2v0b7wIKLZtwCHHXfUr86EmT1z8LEg?=
 =?us-ascii?Q?bzSEaiP86wXw+hQ6TeLGNEDIcTBP9BGtTgQiGBiwLHnd4y99oeCZ4X1C/sHR?=
 =?us-ascii?Q?cDg/JgB3nvPuLwaiuJIcZ2rmE3X3sxLAK2cjyIoHWcYD8CVGCqfxF3mnRzuN?=
 =?us-ascii?Q?Os8NGDCyOMVr9K/51aZG64+tZh4lmWiOq5AAqAjmxsvpMgEZYk+E7Nc9SdjM?=
 =?us-ascii?Q?zyaSHCs/9AYI2L8gciB0Ey+/+TteOr+RZkH9q/w3zRTz0s7zMB+hNCrBzK60?=
 =?us-ascii?Q?aHyOFoIMdq+JgKtuQ8sd/cWx4y3Kxerca+iQMtdNnG0udhbNcV463Osq5apr?=
 =?us-ascii?Q?fgXbJSuEyyceTPBj7o1AjcGCR8j2cmIrmCRFAPmVhUMomh7+bGNUrxGA1w/J?=
 =?us-ascii?Q?+sDHV64y++jOo3n71d84mDZBm4E0Z2a2qxAeGOGGas9tu/hSmuMlXcaeTGZ/?=
 =?us-ascii?Q?T+l9gYgwryyf1QLh2Mu60R36pvvrVhtK64jHKYfc5q9Sz4+1bzzHfGQ7aiQo?=
 =?us-ascii?Q?X+mXY9ymzs7L14drPDWV/zbT1C6TeRTUZwt6E0pQmMQydNENd8RvzrcpqykC?=
 =?us-ascii?Q?Zy5HNrUdiLgy2faI2CkH6FpiORA5cGqznZXkV8LEv8Sl8toSQHq9y3VqwGFv?=
 =?us-ascii?Q?EaarCZo5Pia8UudcDgjs/nfr1J5Xhu8hT3WPocQh9ByJllDkoryNZfFXxacC?=
 =?us-ascii?Q?bTmtNy3hdH7d+nYvCLg8OoS3lOT5FzjiWRxIXgIQ8BtD5RHVR/5+5EPFLtiX?=
 =?us-ascii?Q?Zs6SMH+5PHzn576pPvTjnPcnI2TlwoNIl9tofqmU/wV8Tw/kBMcCTkRSswQ1?=
 =?us-ascii?Q?+jjbdKvln9whTspx929lfFb1l9tZ3vn7UR8fP33qjNo3v65CmPfjPEFqCQk9?=
 =?us-ascii?Q?j5ok1loNSFM+msemi4i3ai6rqNbykWyL+cUCvDJ2SY+A871xLow19gETQSkF?=
 =?us-ascii?Q?28uyKrczvWz+GYfADRWTEfYUE9FTI4OksN1prqOTmYBqnrBO/vZD8R93cV9L?=
 =?us-ascii?Q?1l5xdG5uf3Se9UbMHAs6k31cblw80rVDTZYDBfXaRkKHOKkGQBaLSdvIHdQM?=
 =?us-ascii?Q?ZbXT3R6DSA0Zv1HuQTSpBRsX1MYNHPJGS5du0oi/VLZY4t1sp8lky90+eSI4?=
 =?us-ascii?Q?xDOH6bjil3Hpvh9GjadNT8IiQMYxdhHsIxM1MzpadlTesCxEdO46TMBRpftm?=
 =?us-ascii?Q?INIcqGPPnI45WAVExZNewxoxx/onP4zs594JpS4pWZA85meY37/G1oyR7X7r?=
 =?us-ascii?Q?xQhGXEYTKF4OT4slJP2nFPknPTyLMlLsnPMpwI4etGqpxLeODF7t81rQnu4J?=
 =?us-ascii?Q?duopTIvvRL1bxVKR5amz7zUjWJM9G4KfcQf0FgOR8/r8+HjDGn6RLlW14S3Q?=
 =?us-ascii?Q?c87W53Bu6PLNm5qhGdmvncCmPWsQFSuT1ZJu7qn5zx+P/Gy3qiwg?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 040b7df8-4ffe-4155-20dd-08de477c3ed8
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 08:20:09.3679
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k1iWCNliPvU0d1UTQtiB0S9sPO8iWC2hqpxtt/QEYu6V5a1/XMhEv4vZL6bF7FjufKaVL5M8wWbE8azRnM7eBQbWH/eW0+vJJbZta/cDDMrPcFgtd10gFc7f89B6fJd+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11943

Hi Frank,
Thanks for your review!


On Mon, Dec 29, 2025 at 10:51:09AM -0500, Frank Li wrote:
> On Tue, Dec 23, 2025 at 05:54:08PM +0100, Tommaso Merciai wrote:
> > The Renesas I3C controller does not retain its register state across system
> > suspend, requiring the driver to explicitly save and restore hardware
> > configuration.
> >
> > Add suspend and resume NOIRQ callbacks to handle system sleep transitions.
> >
> > During suspend, save the Device Address Table (DAT) entries, assert reset
> > lines, and disable all related clocks to allow the controller to enter a
> > low-power state.
> >
> > On resume, re-enable clocks and reset lines in the proper order. Restore
> > the REFCKCTL register, master dynamic address, and all DAT entries, then
> > reinitialize the controller.
> >
> > Factor out the common hardware initialization sequence into a dedicated
> > helper to avoid code duplication between bus initialization and resume.
> >
> > Store the target clock rate, reset and clock handles, the REFCLK divider
> > value, and the master dynamic address to restore timing and addressing
> > configuration after resume.
> >
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > ---
> >  drivers/i3c/master/renesas-i3c.c | 246 ++++++++++++++++++++++---------
> >  1 file changed, 179 insertions(+), 67 deletions(-)
> >
> > diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> > index 426a418f29b6..b980e2a84fcd 100644
> > --- a/drivers/i3c/master/renesas-i3c.c
> > +++ b/drivers/i3c/master/renesas-i3c.c
> > @@ -254,12 +254,20 @@ struct renesas_i3c {
> >  	enum i3c_internal_state internal_state;
> >  	u16 maxdevs;
> >  	u32 free_pos;
> > +	u32 dyn_addr;
> >  	u32 i2c_STDBR;
> >  	u32 i3c_STDBR;
> > +	unsigned long rate;
> >  	u8 addrs[RENESAS_I3C_MAX_DEVS];
> >  	struct renesas_i3c_xferqueue xferqueue;
> >  	void __iomem *regs;
> > +	u32 *DATBASn;
> >  	struct clk *tclk;
> > +	struct clk *pclk;
> > +	struct clk *pclkrw;
> > +	struct reset_control *presetn;
> > +	struct reset_control *tresetn;
> > +	u8 refclk_div;
> >  };
> >
> >  struct renesas_i3c_i2c_dev_data {
> > @@ -477,28 +485,79 @@ static int renesas_i3c_reset(struct renesas_i3c *i3c)
> >  				 0, 1000, false, i3c->regs, RSTCTL);
> >  }
> >
> > +static void renesas_i3c_hw_init(struct renesas_i3c *i3c)
> > +{
> 
> Can you split it to new patch to add helper renesas_i3c_hw_init() only.

Will do this in v2.

> 
> > +	u32 val;
> > +
> > +	/* Disable Slave Mode */
> > +	renesas_writel(i3c->regs, SVCTL, 0);
> > +
> > +	/* Initialize Queue/Buffer threshold */
> > +	renesas_writel(i3c->regs, NQTHCTL, NQTHCTL_IBIDSSZ(6) |
> > +		       NQTHCTL_CMDQTH(1));
> > +
> > +	/* The only supported configuration is two entries*/
> > +	renesas_writel(i3c->regs, NTBTHCTL0, 0);
> > +	/* Interrupt when there is one entry in the queue */
> > +	renesas_writel(i3c->regs, NRQTHCTL, 0);
> > +
> > +	/* Enable all Bus/Transfer Status Flags */
> > +	renesas_writel(i3c->regs, BSTE, BSTE_ALL_FLAG);
> > +	renesas_writel(i3c->regs, NTSTE, NTSTE_ALL_FLAG);
> > +
> > +	/* Interrupt enable settings */
> > +	renesas_writel(i3c->regs, BIE, BIE_NACKDIE | BIE_TENDIE);
> > +	renesas_writel(i3c->regs, NTIE, 0);
> > +
> > +	/* Clear Status register */
> > +	renesas_writel(i3c->regs, NTST, 0);
> > +	renesas_writel(i3c->regs, INST, 0);
> > +	renesas_writel(i3c->regs, BST, 0);
> > +
> > +	/* Hot-Join Acknowlege setting. */
> > +	renesas_set_bit(i3c->regs, BCTL, BCTL_HJACKCTL);
> > +
> > +	renesas_writel(i3c->regs, IBINCTL, IBINCTL_NRHJCTL | IBINCTL_NRMRCTL |
> > +		       IBINCTL_NRSIRCTL);
> > +
> > +	renesas_writel(i3c->regs, SCSTLCTL, 0);
> > +	renesas_set_bit(i3c->regs, SCSTRCTL, SCSTRCTL_ACKTWE);
> > +
> > +	/* Bus condition timing */
> > +	val = DIV_ROUND_UP(I3C_BUS_TBUF_MIXED_FM_MIN_NS,
> > +			   NSEC_PER_SEC / i3c->rate);
> > +	renesas_writel(i3c->regs, BFRECDT, BFRECDT_FRECYC(val));
> > +
> > +	val = DIV_ROUND_UP(I3C_BUS_TAVAL_MIN_NS,
> > +			   NSEC_PER_SEC / i3c->rate);
> > +	renesas_writel(i3c->regs, BAVLCDT, BAVLCDT_AVLCYC(val));
> > +
> > +	val = DIV_ROUND_UP(I3C_BUS_TIDLE_MIN_NS,
> > +			   NSEC_PER_SEC / i3c->rate);
> > +	renesas_writel(i3c->regs, BIDLCDT, BIDLCDT_IDLCYC(val));
> > +}
> > +
> >  static int renesas_i3c_bus_init(struct i3c_master_controller *m)
> >  {
> >  	struct renesas_i3c *i3c = to_renesas_i3c(m);
> >  	struct i3c_bus *bus = i3c_master_get_bus(m);
> >  	struct i3c_device_info info = {};
> >  	struct i2c_timings t;
> > -	unsigned long rate;
> > -	u32 double_SBR, val;
> > +	u32 double_SBR;
> >  	int cks, pp_high_ticks, pp_low_ticks, i3c_total_ticks;
> >  	int od_high_ticks, od_low_ticks, i2c_total_ticks;
> >  	int ret;
> >
> > -	rate = clk_get_rate(i3c->tclk);
> > -	if (!rate)
> > +	i3c->rate = clk_get_rate(i3c->tclk);
> > +	if (!i3c->rate)
> >  		return -EINVAL;
> >
> >  	ret = renesas_i3c_reset(i3c);
> >  	if (ret)
> >  		return ret;
> >
> > -	i2c_total_ticks = DIV_ROUND_UP(rate, bus->scl_rate.i2c);
> > -	i3c_total_ticks = DIV_ROUND_UP(rate, bus->scl_rate.i3c);
> > +	i2c_total_ticks = DIV_ROUND_UP(i3c->rate, bus->scl_rate.i2c);
> > +	i3c_total_ticks = DIV_ROUND_UP(i3c->rate, bus->scl_rate.i3c);
> >
> >  	i2c_parse_fw_timings(&m->dev, &t, true);
> >
> > @@ -511,7 +570,7 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
> >  			pp_high_ticks = ((i3c_total_ticks * 5) / 10);
> >  		else
> >  			pp_high_ticks = DIV_ROUND_UP(I3C_BUS_THIGH_MIXED_MAX_NS,
> > -						     NSEC_PER_SEC / rate);
> > +						     NSEC_PER_SEC / i3c->rate);
> >  		pp_low_ticks = i3c_total_ticks - pp_high_ticks;
> >
> >  		if ((od_low_ticks / 2) <= 0xFF && pp_low_ticks < 0x3F)
> > @@ -519,7 +578,7 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
> >
> >  		i2c_total_ticks /= 2;
> >  		i3c_total_ticks /= 2;
> > -		rate /= 2;
> > +		i3c->rate /= 2;
> >  	}
> >
> >  	/* SCL clock period calculation in Open-drain mode */
> > @@ -540,8 +599,8 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
> >  			STDBR_SBRLP(pp_low_ticks) |
> >  			STDBR_SBRHP(pp_high_ticks);
> >
> > -	od_low_ticks -= t.scl_fall_ns / (NSEC_PER_SEC / rate) + 1;
> > -	od_high_ticks -= t.scl_rise_ns / (NSEC_PER_SEC / rate) + 1;
> > +	od_low_ticks -= t.scl_fall_ns / (NSEC_PER_SEC / i3c->rate) + 1;
> > +	od_high_ticks -= t.scl_rise_ns / (NSEC_PER_SEC / i3c->rate) + 1;
> >  	i3c->i2c_STDBR = (double_SBR ? STDBR_DSBRPO : 0) |
> >  			STDBR_SBRLO(double_SBR, od_low_ticks) |
> >  			STDBR_SBRHO(double_SBR, od_high_ticks) |
> > @@ -556,55 +615,16 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
> >  					   EXTBR_EBRHP(pp_high_ticks));
> >
> >  	renesas_writel(i3c->regs, REFCKCTL, REFCKCTL_IREFCKS(cks));
> > +	i3c->refclk_div = cks;
> >
> > -	/* Disable Slave Mode */
> > -	renesas_writel(i3c->regs, SVCTL, 0);
> > -
> > -	/* Initialize Queue/Buffer threshold */
> > -	renesas_writel(i3c->regs, NQTHCTL, NQTHCTL_IBIDSSZ(6) |
> > -					     NQTHCTL_CMDQTH(1));
> > -
> > -	/* The only supported configuration is two entries*/
> > -	renesas_writel(i3c->regs, NTBTHCTL0, 0);
> > -	/* Interrupt when there is one entry in the queue */
> > -	renesas_writel(i3c->regs, NRQTHCTL, 0);
> > -
> > -	/* Enable all Bus/Transfer Status Flags */
> > -	renesas_writel(i3c->regs, BSTE, BSTE_ALL_FLAG);
> > -	renesas_writel(i3c->regs, NTSTE, NTSTE_ALL_FLAG);
> > -
> > -	/* Interrupt enable settings */
> > -	renesas_writel(i3c->regs, BIE, BIE_NACKDIE | BIE_TENDIE);
> > -	renesas_writel(i3c->regs, NTIE, 0);
> > -
> > -	/* Clear Status register */
> > -	renesas_writel(i3c->regs, NTST, 0);
> > -	renesas_writel(i3c->regs, INST, 0);
> > -	renesas_writel(i3c->regs, BST, 0);
> > -
> > -	/* Hot-Join Acknowlege setting. */
> > -	renesas_set_bit(i3c->regs, BCTL, BCTL_HJACKCTL);
> > -
> > -	renesas_writel(i3c->regs, IBINCTL, IBINCTL_NRHJCTL | IBINCTL_NRMRCTL |
> > -					     IBINCTL_NRSIRCTL);
> > -
> > -	renesas_writel(i3c->regs, SCSTLCTL, 0);
> > -	renesas_set_bit(i3c->regs, SCSTRCTL, SCSTRCTL_ACKTWE);
> > -
> > -	/* Bus condition timing */
> > -	val = DIV_ROUND_UP(I3C_BUS_TBUF_MIXED_FM_MIN_NS, NSEC_PER_SEC / rate);
> > -	renesas_writel(i3c->regs, BFRECDT, BFRECDT_FRECYC(val));
> > -
> > -	val = DIV_ROUND_UP(I3C_BUS_TAVAL_MIN_NS, NSEC_PER_SEC / rate);
> > -	renesas_writel(i3c->regs, BAVLCDT, BAVLCDT_AVLCYC(val));
> > -
> > -	val = DIV_ROUND_UP(I3C_BUS_TIDLE_MIN_NS, NSEC_PER_SEC / rate);
> > -	renesas_writel(i3c->regs, BIDLCDT, BIDLCDT_IDLCYC(val));
> > +	/* I3C hw init*/
> > +	renesas_i3c_hw_init(i3c);
> >
> >  	ret = i3c_master_get_free_addr(m, 0);
> >  	if (ret < 0)
> >  		return ret;
> >
> > +	i3c->dyn_addr = ret;
> >  	renesas_writel(i3c->regs, MSDVAD, MSDVAD_MDYAD(ret) | MSDVAD_MDYADV);
> >
> >  	memset(&info, 0, sizeof(info));
> > @@ -1301,8 +1321,6 @@ static const struct renesas_i3c_irq_desc renesas_i3c_irqs[] = {
> >  static int renesas_i3c_probe(struct platform_device *pdev)
> >  {
> >  	struct renesas_i3c *i3c;
> > -	struct reset_control *reset;
> > -	struct clk *clk;
> >  	const struct renesas_i3c_config *config = of_device_get_match_data(&pdev->dev);
> >  	int ret, i;
> >
> > @@ -1317,28 +1335,28 @@ static int renesas_i3c_probe(struct platform_device *pdev)
> >  	if (IS_ERR(i3c->regs))
> >  		return PTR_ERR(i3c->regs);
> >
> > -	clk = devm_clk_get_enabled(&pdev->dev, "pclk");
> > -	if (IS_ERR(clk))
> > -		return PTR_ERR(clk);
> > +	i3c->pclk = devm_clk_get_enabled(&pdev->dev, "pclk");
> > +	if (IS_ERR(i3c->pclk))
> > +		return PTR_ERR(i3c->pclk);
> >
> >  	if (config->has_pclkrw) {
> > -		clk = devm_clk_get_enabled(&pdev->dev, "pclkrw");
> > -		if (IS_ERR(clk))
> > -			return PTR_ERR(clk);
> > +		i3c->pclkrw = devm_clk_get_enabled(&pdev->dev, "pclkrw");
> > +		if (IS_ERR(i3c->pclkrw))
> > +			return PTR_ERR(i3c->pclkrw);
> >  	}
> >
> >  	i3c->tclk = devm_clk_get_enabled(&pdev->dev, "tclk");
> >  	if (IS_ERR(i3c->tclk))
> >  		return PTR_ERR(i3c->tclk);
> >
> > -	reset = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, "tresetn");
> > -	if (IS_ERR(reset))
> > -		return dev_err_probe(&pdev->dev, PTR_ERR(reset),
> > +	i3c->tresetn = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, "tresetn");
> > +	if (IS_ERR(i3c->tresetn))
> > +		return dev_err_probe(&pdev->dev, PTR_ERR(i3c->tresetn),
> >  				     "Error: missing tresetn ctrl\n");
> >
> > -	reset = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, "presetn");
> > -	if (IS_ERR(reset))
> > -		return dev_err_probe(&pdev->dev, PTR_ERR(reset),
> > +	i3c->presetn = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, "presetn");
> > +	if (IS_ERR(i3c->presetn))
> > +		return dev_err_probe(&pdev->dev, PTR_ERR(i3c->presetn),
> >  				     "Error: missing presetn ctrl\n");
> 
> And another patch to save clk, rate and reset to into struct renesas_i3c.

I will do this in v2.

> 
> >
> >  	spin_lock_init(&i3c->xferqueue.lock);
> > @@ -1364,6 +1382,13 @@ static int renesas_i3c_probe(struct platform_device *pdev)
> >  	i3c->maxdevs = RENESAS_I3C_MAX_DEVS;
> >  	i3c->free_pos = GENMASK(i3c->maxdevs - 1, 0);
> >
> > +	/* Allocate dynamic Device Address Table backup. */
> > +	i3c->DATBASn = devm_kzalloc(&pdev->dev,
> > +				    sizeof(u32) * i3c->maxdevs,
> > +				    GFP_KERNEL);
> > +	if (!i3c->DATBASn)
> > +		return -ENOMEM;
> > +
> >  	return i3c_master_register(&i3c->base, &pdev->dev, &renesas_i3c_ops, false);
> >  }
> >
> > @@ -1374,6 +1399,92 @@ static void renesas_i3c_remove(struct platform_device *pdev)
> >  	i3c_master_unregister(&i3c->base);
> >  }
> >
> > +static int renesas_i3c_suspend_noirq(struct device *dev)
> > +{
> > +	struct renesas_i3c *i3c = dev_get_drvdata(dev);
> > +	int i, ret;
> > +
> > +	i2c_mark_adapter_suspended(&i3c->base.i2c);
> > +
> > +	/* Store Device Address Table values. */
> > +	for (i = 0; i < i3c->maxdevs; i++)
> > +		i3c->DATBASn[i] = renesas_readl(i3c->regs, DATBAS(i));
> > +
> > +	ret = reset_control_assert(i3c->presetn);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = reset_control_assert(i3c->tresetn);
> > +	if (ret) {
> > +		reset_control_deassert(i3c->presetn);
> > +		return ret;
> > +	}
> > +
> > +	clk_disable_unprepare(i3c->pclk);
> > +	clk_disable_unprepare(i3c->tclk);
> > +	clk_disable_unprepare(i3c->pclkrw);
> > +
> > +	return 0;
> > +}
> > +
> > +static int renesas_i3c_resume_noirq(struct device *dev)
> > +{
> > +	struct renesas_i3c *i3c = dev_get_drvdata(dev);
> > +	int i, ret;
> > +
> > +	ret = reset_control_deassert(i3c->presetn);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = reset_control_deassert(i3c->tresetn);
> > +	if (ret)
> > +		goto err_presetn;
> > +
> > +	ret = clk_prepare_enable(i3c->pclkrw);
> > +	if (ret)
> > +		goto err_tresetn;
> > +
> > +	ret = clk_prepare_enable(i3c->pclk);
> > +	if (ret)
> > +		goto err_pclkrw;
> > +
> > +	ret = clk_prepare_enable(i3c->tclk);
> > +	if (ret)
> > +		goto err_pclk;
> 
> Can you use clk bulk API? Just for reference, clk prepare have mutex lock,
> which may cause dead lock, such as if use gpio expendor to control external
> clock gate.
> 
> https://lists.openwall.net/linux-kernel/2025/07/01/139
> https://lore.kernel.org/imx/87pldsd1tq.fsf@bootlin.com/#t

Thanks for sharing.
My plan is to add then

struct clk_bulk_data clks[3];
u8 num_clks;

and

static const char * const renesas_i3c_clks[] = {
	"pclk", "tclk", "pclkrw"
};

Then into the renesas_i3c_probe() we can use:

	i3c->num_clks = config->has_pclkrw ? 3 : 2;

	for (i = 0; i < i3c->num_clks; i++)
		i3c->clks[i].id = renesas_i3c_clks[i];

	ret = devm_clk_bulk_get(&pdev->dev, i3c->num_clks, i3c->clks);
	if (ret)
		return ret;

	ret = clk_bulk_prepare_enable(i3c->num_clks, i3c->clks);
	if (ret)
		return ret;

And update then renesas_i3c_resume_noirq()/renesas_i3c_suspend_noirq()
with:
	
	clk_bulk_prepare_enable(i3c->num_clks, i3c->clks);
	clk_bulk_disable_unprepare(i3c->num_clks, i3c->clks)

Thanks & Regards,
Tommaso


> 
> Frank
> 
> > +
> > +	/* Re-store I3C registers value. */
> > +	renesas_writel(i3c->regs, REFCKCTL,
> > +		       REFCKCTL_IREFCKS(i3c->refclk_div));
> > +	renesas_writel(i3c->regs, MSDVAD, MSDVAD_MDYADV |
> > +		       MSDVAD_MDYAD(i3c->dyn_addr));
> > +
> > +	/* Restore Device Address Table values. */
> > +	for (i = 0; i < i3c->maxdevs; i++)
> > +		renesas_writel(i3c->regs, DATBAS(i), i3c->DATBASn[i]);
> > +
> > +	/* I3C hw init. */
> > +	renesas_i3c_hw_init(i3c);
> > +
> > +	i2c_mark_adapter_resumed(&i3c->base.i2c);
> > +
> > +	return 0;
> > +
> > +err_pclk:
> > +	clk_disable_unprepare(i3c->pclk);
> > +err_pclkrw:
> > +	clk_disable_unprepare(i3c->pclkrw);
> > +err_tresetn:
> > +	reset_control_assert(i3c->tresetn);
> > +err_presetn:
> > +	reset_control_assert(i3c->presetn);
> > +	return ret;
> > +}
> > +
> > +static const struct dev_pm_ops renesas_i3c_pm_ops = {
> > +	NOIRQ_SYSTEM_SLEEP_PM_OPS(renesas_i3c_suspend_noirq,
> > +				  renesas_i3c_resume_noirq)
> > +};
> > +
> >  static const struct renesas_i3c_config empty_i3c_config = {
> >  };
> >
> > @@ -1394,6 +1505,7 @@ static struct platform_driver renesas_i3c = {
> >  	.driver = {
> >  		.name = "renesas-i3c",
> >  		.of_match_table = renesas_i3c_of_ids,
> > +		.pm = pm_sleep_ptr(&renesas_i3c_pm_ops),
> >  	},
> >  };
> >  module_platform_driver(renesas_i3c);
> > --
> > 2.43.0
> >

