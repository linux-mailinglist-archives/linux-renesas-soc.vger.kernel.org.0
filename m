Return-Path: <linux-renesas-soc+bounces-31014-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iFdvOHRa1mk1EggAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31014-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 15:39:00 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6B73BD0D1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 15:39:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B23763014685
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Apr 2026 13:38:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A94893CF05C;
	Wed,  8 Apr 2026 13:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="DnuGjU7Z"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010037.outbound.protection.outlook.com [52.101.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CADD3C9EE8;
	Wed,  8 Apr 2026 13:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775655538; cv=fail; b=XhGQL65rwkPSWPmXgKVTOqIElDdkl5rTvAGVcGgpKksHVnDNg0tU6CVufzDq4asvrFU9Oxg/OrWbMJRAQZZwoB7p+Hyc5iViB1q/+jUoxkdeQC6/iGswIlw5tPXH6IqGJ5RTLfC/o/0aCZ0jhDRBS/JkB9VrDWgyWjZtC9ZvAi4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775655538; c=relaxed/simple;
	bh=ple68CksOOKs8uUc6N5Tp+dd6XlH+L0TPKcU90dlDzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Yi6NRTBaigqqyT7ssiVZ7MWtSHL53G/E6D9sIIKDuV6HFWMjQQmFftOvEL6wAWegsB7vKvfnj9HSa3lk+Fbr3K2Bk1U+/nmapVE17TkqK5j2lKRogCTh8o7guU55UAfRhlABp7TBa6sho4wxDj5J58i+3HTLa4+WIQ5eF7aWasE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=DnuGjU7Z; arc=fail smtp.client-ip=52.101.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dkj4wN58Qk7y+T2UfEd5mHHnzdEMhhPo4Ccmmapuu99BuU+gyvT2oIaxbHA8b63I7JfcdHgMZDlxguXeiR1nukz/AlCILZTV9i4MjQua8awVg2Pn+8FkkZO6HFqSJ/0cY9CsnvP0WQBBDd5Hf0R2xCMRmSuRLBMlu8iSjWBGCYcedRjkUkon+C8XPNfiwnEbL2UkWG/tVSGdlaXMEzHF4KVxUmOB0DflqtQDQZqPtBik5KRccf6+52fV3rPkZAtDB0a4SAlyEG8D8EqQN65o7tqriOiHCVaSuavQg5a49VLbigG1lSZEZw0Qxjd32rH3ywVu9Fczdf/ZlhbzNTXjPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wVeBq3FWekNfxCCkzbTMD9IniijCphPt7AR8p8WxCzs=;
 b=B6JHibwxIeLPwBwsLoNhXy5c37y9ZHPEsPEGGKYfgpixT3g+CBO/zaeHMqA9lFna7c2oHz7cZTzWuKTe1D7/6/HynGnzlcomizyaKl6qcE6YCxOse05TPAvcN7YBHUrymmvr9WzwC8dJe9NVk0mEO6t4FX+c9thX0A6HpiDaw+VWflK8U1mVCRkLZ/LuzXds6a/IGzv/7dDRvQhVoUh0F3C0B6C2Zy0qxm19nrfydsguCsvjXXQDQj1RBcvzOqg6HrDQ5uiqutYN3po51iTmokt5tJZJg2JgBp47C2wsi3huLMpFJNTtwuS2frgsLru0ECJv5kG84wF/wnMKqEG+FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wVeBq3FWekNfxCCkzbTMD9IniijCphPt7AR8p8WxCzs=;
 b=DnuGjU7ZlhTiEUM6c2ABwOEu5yMCWFXnpOTHaxSriunT5DURfW/6R9g7yM0+Ii99rZpFK5/i2YOTyQGqqhjLaGkciJyXmISAr9ccth6ycennJ8nSAvwDvIObLxD1hXcULCGkumFJVgAxehiyuR4fiGeRUX07jhbV/hrpZ1bfwYw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYWPR01MB11341.jpnprd01.prod.outlook.com (2603:1096:400:3f0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Wed, 8 Apr
 2026 13:38:53 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9769.017; Wed, 8 Apr 2026
 13:38:53 +0000
Date: Wed, 8 Apr 2026 15:38:37 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: tomm.merciai@gmail.com, peda@axentia.se, p.zabel@pengutronix.de,
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: dts: renesas: Add missing #mux-state-cells to
 usb2phy-reset nodes
Message-ID: <adZaXSDsv4f9d8Bp@tom-desktop>
References: <cover.1775575276.git.tommaso.merciai.xr@bp.renesas.com>
 <CAMuHMdXHhd150mpUT5-VPcHW0W5Hs-rFC-Bjrc7Z8Szco9P_Xw@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXHhd150mpUT5-VPcHW0W5Hs-rFC-Bjrc7Z8Szco9P_Xw@mail.gmail.com>
X-ClientProxiedBy: FR2P281CA0153.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::20) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYWPR01MB11341:EE_
X-MS-Office365-Filtering-Correlation-Id: d103c65c-7034-4d86-72cb-08de95742cb8
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	atThZ3oZ9vOYh93lFT+B4mKe7FI+TmqEyMeV4t2qu1KCpj3VLNT1I8OYhv8ry1c0PIP2s7A2WOv0tgffAnS4zbZ/t9Nr/SC7tNg0hfzvY2pa7UDvqIZh/GDbb9rDOREf5oQ4lS41Nscj5Xh0Kr+DpgDtANbapnX9qal3dGtcQLmNaYjKocLCtUc+9UE2cBroakAmyMDkzbI1lIE02CoPpQcTqybbTkTRGbvF0KtvuPpQVIsvbc8sH/XvWxHpPZDXsL9PzGsM7uH74kWEBaqMLKRbI8pEb7TQUf82BDVLEFMlK6xOK/ZQEQRMUqROQwTU2UaKmc2c6bsc0Ug2ykjIE6rOPs4Pw90rkFF72YwANPH0SsZcXdlMJS81/sVrbR0Pp5SKwmiZGRLdXcwDaS6CXWN1IinrN2HginVsT0l9zbVCrzlbDP0/BykQpwSwqhexdWWfnkbLpf3FO52VmxaQJTSTmc4OeZwN05Svq68gWAUkquiRB1MoE0iF0d7X7mtki7oSwi5rcu0oheKYcbbR/yucvUAsVP2ElsRFkg3ZujPC7xQ0W7Yu2udalAU0A4uCk0VT231idbmSxy7U30XvgkRTcawSFVnSZI5GxUw/pFB+gTj9rUOKVIA2/sGIBeea2H2tccE4htFXL3akQY/OfG+g716DaScqABKl9aKugyfvhVykLnWSbROASmjFSZBy6RefQa0v0yxz9pF9yMixCCVuZRZ1q1oHOm3yKko4h9uGY3h/EALjJEQOB5xVbXx7k1NrZYDehX3+FXc5XG6GnHamxAU22ybjYr5P+LBjc+TCwv+AClCXhW6uelVM9ifK
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?S5uz3qYgisN2oPOzGX3IQ9QgTCCMeD89XIlnqmwrK80PpEdlkIGeLtqZm/uG?=
 =?us-ascii?Q?GN+bhXzI4SIEfvVU1Lc+dYf0IwgP9RqQrLMFCw6Ii43WKiOPM/p8iYrgCDNs?=
 =?us-ascii?Q?db9hrIQUy4rH4hR6gVoKKc+buxWdtr8HRUKnCU85yiKJ2M/+1n8VvffW6qgD?=
 =?us-ascii?Q?YDpJFJnPDAapqr4mR9IvCY7+NwPXDJp9qlQaokQYtOtJU1F1OXO6zVc3nHT/?=
 =?us-ascii?Q?guh/VVPeG4BE4U0A+tB0oUo4DBM19Z28ZqJ+2ToeWxTGz+WidrX8+NYG9Z8T?=
 =?us-ascii?Q?CLmWfRnM/a4MNtGDuTEZj9ab7oEt+gnA0etpjMAkuUWcKAB4xd9tuWEwfhI5?=
 =?us-ascii?Q?9AXE6pwlFWkswrvMvKaY1TMscs553Z5/65e+4ecFmNE3SmVYMYdkB8t9BMJn?=
 =?us-ascii?Q?gIpQHtbvDFPmutnw6Xe3WDpjFKAvlQETtYmkdyfe3anW7wDBXdd5WMTTJrUA?=
 =?us-ascii?Q?upr8HvbRth3TXPgC/8PJ/uwKlSQbKREH/GVGVZVopKDgjoAZZ/o1AYxNg8qB?=
 =?us-ascii?Q?Gxi9IGAKD5EqwiKDg221GJTDVqJ4WZrwE/jts4rr+fc9Mb92SC3RRU41KGJj?=
 =?us-ascii?Q?6nriGT4R2+0yYFxgvrfcbMd8a9Pu8wpEUhFcJ5Ra6JZtS8X80N48qbgiyS0v?=
 =?us-ascii?Q?+FVfXxQxrKrRwygTe3Z+7huPCtcc42dowt50rpiJhScJg0JDKepQqyW/+s6c?=
 =?us-ascii?Q?sDBCOvlxa6WLXart9LRqCbjgjzFJVhBzmYhdULsttqMxZUM+T3b7KJX/WhxL?=
 =?us-ascii?Q?liSujyWNhQNNdWZLwAE2xQRTyUP3LGApjgqyU0O0lXYFxxSJWUbtStKqW1Do?=
 =?us-ascii?Q?s6IKoWVQyKNmgezKrloPA9co7rhJy+Fw6SmsNxu18qN14lswOMLhuqhiiroK?=
 =?us-ascii?Q?nZriqHui6nIOuVDT5z3HMQ7ejmqB2E75xwYts8SCjYfpp8eVUYKEhLBDPSE7?=
 =?us-ascii?Q?R1pc+fsphaKfDqU1pUbhuv2wGxuDgXp7wYSx3GljoxB39iYTpDIo4sjG9BcH?=
 =?us-ascii?Q?LOrjifORkaJ7fPYKg64nW1rxEkIkmKvID4SJ8IPbR7ng+BGHMPg6musbVzgv?=
 =?us-ascii?Q?kL15LjkoGhvon4xRRxfZ03wX4VNhEFbqA/SDMgQHebuQa0j0XmROrUoDLZ2V?=
 =?us-ascii?Q?poNHUTIPZtOvrBxT0CM1DB+lK8/eqTm/mTz6eHA4x+6gqOaqQPhtz3t+pZmt?=
 =?us-ascii?Q?3KIP2E2uxkOLjHY6E1E3upkrOSLqwW2w022rtYP7cbpotXfLzeU1vTocDofv?=
 =?us-ascii?Q?VBGcZLwsL3QiTVs4+Ogj4b+iLwbvz/p2c84Wav5CzaSVfISM3tohqTCKdHYF?=
 =?us-ascii?Q?qFubqsUThaWuq2QSLBDewYZo5D39aFWN3YmU4o4pEEMsFe7ZzIRoALZ3p/u4?=
 =?us-ascii?Q?FdydNIy98rzszlEKy8HCyV7K7FTqI8jVS5MmLEKy3V87kJruf9ankUKukv4l?=
 =?us-ascii?Q?/JP0nL1IlxTRgJNT4IcqYv1tsGfHxTaqkYD9GA5ilH341R5ZSf4U9fWPPqhS?=
 =?us-ascii?Q?NL6nZOAEDWr4mMYD3IXyxhyVJLlP/TLDT8XZru27m7IA10DM0l0Fy3GtWdBf?=
 =?us-ascii?Q?7gHOrvfcw5fieoFpexNImCsAeZCOlz5nJChrLJJT/qe24Z5mF4qxDBkUinnz?=
 =?us-ascii?Q?LhkoBJOAHI0TlJIsYQENKJ9TJdg76DswgQqvZjq/A/CMLb9k0uLszZea+s8s?=
 =?us-ascii?Q?Tb0w0sOmBftoKqy0w9t8IFrjD9UG8KRy+v45UsRp/zTt73P9gOZwxP0mBpe7?=
 =?us-ascii?Q?sAojc5rCc8jMYcZVSE+p1X1/tge5Pk1qF2I351Cl84Yr/irx4A/4?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d103c65c-7034-4d86-72cb-08de95742cb8
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 13:38:53.6275
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n8M3+vd7xzT+nLCm/tslwft7PpaZTD3caqaMSuW59OcIoII0kh+vOc9+jsCMJVwcRlkk9N6++C7dVAjGzM02w5021XYAb6xy/eoSg9x3h0znPli6WRK2he0awWPDqymZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11341
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[gmail.com,axentia.se,pengutronix.de,vger.kernel.org,bp.renesas.com,kernel.org,linaro.org];
	TAGGED_FROM(0.00)[bounces-31014-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	DBL_PROHIBIT(0.00)[0.241.179.0:email];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	NEURAL_HAM(-0.00)[-0.999];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linux-m68k.org:email,renesas.com:email,bp.renesas.com:dkim,0.241.139.240:email]
X-Rspamd-Queue-Id: 7A6B73BD0D1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Geert,
Thanks for your comments.

On Wed, Apr 08, 2026 at 03:07:44PM +0200, Geert Uytterhoeven wrote:
> Hi Tommaso,
> 
> On Tue, 7 Apr 2026 at 17:35, Tommaso Merciai
> <tommaso.merciai.xr@bp.renesas.com> wrote:
> > The renesas,rzv2h-usb2phy-reset binding schema defines #mux-state-cells as a
> > required property. Add it to the USB2 PHY reset nodes in the RZ/V2H and RZ/V2N
> > device trees to fix dtbs_check warnings.
> >
> > "arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: usb20phy-reset@15830000 (renesas,r9a09g056-usb2phy-reset): '#mux-state-cells' is a required property"
> > "arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: usb20phy-reset@15830000 (renesas,r9a09g056-usb2phy-reset): '#mux-state-cells' is a required property"
> > "arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: usb20phy-reset@15830000 (renesas,r9a09g056-usb2phy-reset): '#mux-state-cells' is a required property"
> > "arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dtb: usb20phy-reset@15830000 (renesas,r9a09g057-usb2phy-reset): '#mux-state-cells' is a required property"
> > "arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dtb: usb21phy-reset@15840000 (renesas,r9a09g057-usb2phy-reset): '#mux-state-cells' is a required property"
> > "arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-emmc.dtb: usb20phy-reset@15830000 (renesas,r9a09g057-usb2phy-reset): '#mux-state-cells' is a required property"
> > "arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-emmc.dtb: usb21phy-reset@15840000 (renesas,r9a09g057-usb2phy-reset): '#mux-state-cells' is a required property"
> > "arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-sd.dtb: usb20phy-reset@15830000 (renesas,r9a09g057-usb2phy-reset): '#mux-state-cells' is a required property"
> > "arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-sd.dtb: usb21phy-reset@15840000 (renesas,r9a09g057-usb2phy-reset): '#mux-state-cells' is a required property"
> >
> > Kind Regards,
> > Tommaso
> >
> > Tommaso Merciai (2):
> >   arm64: dts: renesas: r9a09g057: Add #mux-state-cells to
> >     usb2{0,1}phyrst
> >   arm64: dts: renesas: r9a09g056: Add #mux-state-cells to usb20phyrst
> 
> Does this series supersedes "[PATCH v5 16/22] arm64: dts: renesas:
> r9a09g056: Add USB2.0 VBUS_SEL mux-controller support"[1] and "[PATCH
> v5 17/22] arm64: dts: renesas: r9a09g056: Add USB2.0 PHY VBUS internal
> regulator node"[2]?

Yes, thanks.

From v5 only [0] missing.
But I think Ulf is planning to pick [0].

I will rebase/send RZ/G3E USB2.0 dt patches later.

[0] https://patchwork.kernel.org/project/linux-renesas-soc/patch/cda933586ef7ca119dbbcef45a921c29dd517698.1775047175.git.tommaso.merciai.xr@bp.renesas.com/


Kind Regards,
Tommaso




> 
> Thanks!
> 
> [1] https://lore.kernel.org/c63d0a62d439a78e9ccc0b4176b84bbc32629a8e.1764241212.git.tommaso.merciai.xr@bp.renesas.com
> [2] https://lore.kernel.org/f33b5566511a946e4e909854213e75c12d89a441.1764241212.git.tommaso.merciai.xr@bp.renesas.com
> 
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
> 

