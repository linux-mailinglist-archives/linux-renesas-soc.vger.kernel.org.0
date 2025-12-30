Return-Path: <linux-renesas-soc+bounces-26205-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A61CEA2AF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Dec 2025 17:25:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8619D30245F8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Dec 2025 16:25:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6297E3203B2;
	Tue, 30 Dec 2025 16:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="kkilof74"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010042.outbound.protection.outlook.com [52.101.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68081DE2C9;
	Tue, 30 Dec 2025 16:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767111920; cv=fail; b=PZe9VOdWyvCKhUdcCq4YQ1/3gAUUa+9ssp7oE6OjxcrjDgHTREdLzj74V2kMBoLKlh/CLOs+FJZekddIh+d5V0GXTUPHTF+2zGDd7YirlAdn4C6c/bUNYE5MGwUO/1wTN1MqIJ3SyzqsmGDVko7ErjZxgOpOFc0yqFYP78ZSpTw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767111920; c=relaxed/simple;
	bh=YCFNIMOcZowAZZcXgDIT8I6o+/tWsMDoPh/vrw4w840=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ugd7ClEw0/HYN9XCCk5kLBgsEyjAJu5nY/fTQvSEE3FwsGFxW/jUI35due61xYSV8jquxPHS1f1o1Tl/gjEmbt1kNHpFwedBIAM/cSUmaxOmw+xDISuZicyIM6fdEseRoufM2LpCRSfBI3/GZUig715Xl+e0WBH7Ani3Eljo4+A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=kkilof74; arc=fail smtp.client-ip=52.101.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hu33zDZnThOVr6ERYpFgMxAG59HGarkJnMEi6eLVt43VHmrtcUOgjsZPPGN/BiqX3w8o4X/2kmuHmClFVRTF/0HtEe0HdSasY7so9Gke573AiZgqpV902g+uvPMy0vTnfTMaQ84Yf3BydbemlL/gDz3CT89F43KBwnUlTcxrKySMx/356saGwOT7OZG2L8SDKCNL1H9Lk5VbuNXGMXeriWHOmriK6B72wRk7C8QqwOYxlaQpLSo6PPnbdyAFZfQLTtPRs3iSpaQMLRSiZgT1/duJtTO4qAP+KEFiWF9yKXqsF5QQGqxZ81W+tOACDGqnfVIa5DDDjBFKrHjbblGPZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bd/uuysH/4McidHS8cNAi3r0z1sA5PRw/+G4k/m/pPc=;
 b=RarlSKR1IB0oE8uF9v3lCKtZ+26ZWIsHF6MkGQiImChp1VxBLL1cPCo1T7WDBQ+EZ/xcYxkwKTXpJYsMllwA70ebrcCYDznfl9tazCBGDgR+e6JXdzv0iQAszEFMXG+jcn6Yvu8Jym2D6HeoLJgTgRJbwlK1o2nh41rRupNMrdKsybmSXLsDcr+IqMo9iITdTnn6tUKRQGLoS21Y/5j3bYItDFW8yWHHrqnsM6AQv0aqfCwGeu0kVxJRpriXkBtECUBV6S5aGgjt/m60HcuTvC1FSqIcl1cG9tsuhvEjgVVgJ3qqC4VH1wzGEhmyiGG3fYBBOy7yU2nViv77HK4zSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bd/uuysH/4McidHS8cNAi3r0z1sA5PRw/+G4k/m/pPc=;
 b=kkilof74WgFDOeevZE7p1Mk4bJQeKQCb/J/fLNO683FecaZc9k4ouWJK9K3lxhC0OYmEXzNGCEPpW4bM3/3n1pK7S9WOcn8zyzhH9geUdSCsGo6fugPF+KYR3sEMdXSUPEP9/d7PMVEZxqlTp5Wc5jBaxF7In7tAR5NbDPNIqeY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYRPR01MB16231.jpnprd01.prod.outlook.com (2603:1096:405:2e8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 30 Dec
 2025 16:25:11 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9478.004; Tue, 30 Dec 2025
 16:25:09 +0000
Date: Tue, 30 Dec 2025 17:24:54 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Frank Li <Frank.li@nxp.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] i3c: renesas: Switch to clk_bulk API and store
 clocks in private data
Message-ID: <aVP81n7yRgeHz3FX@tom-desktop>
References: <cover.1767090535.git.tommaso.merciai.xr@bp.renesas.com>
 <29d6558c381b726f53c22088a5a2ad5adf9fe142.1767090535.git.tommaso.merciai.xr@bp.renesas.com>
 <aVPzQrFL7T5KP1jI@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aVPzQrFL7T5KP1jI@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: FR4P281CA0312.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f6::19) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYRPR01MB16231:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d557dbd-e074-42c7-0b08-08de47bfffbd
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rt0gWYGSpPt2/9JmZz7pulcXmN4id68blMen6xHEnMlHKJwZXH5YgHCYet4C?=
 =?us-ascii?Q?BoBRJewoA9boqWzfmWwvUZyeNqxJXDvezmazOaKMPaTHP+SN0A13Dw6WP4nB?=
 =?us-ascii?Q?ik9O5O7iRq9rmu07vjHafQ7AS51RLeHeyluTQYbz3CwBvYs4NXdiHPvmmEhA?=
 =?us-ascii?Q?ETpdQucKvafcLhlLbTiei/P4gb3+3dbKuDDdYd3gu7CdI8R6l1AtS0zNIaSg?=
 =?us-ascii?Q?H/0mXYmUBIAMZUeRCgPJaqSVhIiacVJl73LHY48eEfP0YPtYx4YcXkjU1Vzy?=
 =?us-ascii?Q?SI28UbwMpfJfY8S4g0JyqhxEwvcyCnzUUJ+zAwWZ+7UteQjIHKmfgpt2p7e+?=
 =?us-ascii?Q?l3b/nT5E+9Ig/KZobydZoEBGcT1uI+VngvXp5wRNMH1RAKYOpRoPEN+YiwAw?=
 =?us-ascii?Q?tUNURwQTvL769rfqtiDn2Lng2LnXBIGurFUYNN/OMVD9NWMzJAkKXG2xl1+y?=
 =?us-ascii?Q?6B68NYhJTkY0FKZoWVhfsjUK2JqM24GQwdN1dXGcvkicdV2hKWnm1bsuutzJ?=
 =?us-ascii?Q?Ue79HUTVkfQHhQ1nA7+wndJ0rxCclJFGiAgYl5hTQMMTlYTDN8FL0fgNRN6a?=
 =?us-ascii?Q?DsWSOFYelpvWAil50qguJFp6oMz1SMQ8TME1IpoPt6zhQhfL2p1MpVMI/2vj?=
 =?us-ascii?Q?RDTndQgSqgE/9Jfz4wxcGdUigJ/mGRR5e1Rc4EkCtYXN2TSNdgy7Tl6sOyFB?=
 =?us-ascii?Q?PX/XPS7MTaGyCekppwYVXUOWYEeB64ybRmjBTNiobzn0tqJuSfmRyXwacFzX?=
 =?us-ascii?Q?z2w+r57j6BbF9MjAszeisEpenPwjqwvzntn7lFuquE7D8xRHNATfTEQmpduV?=
 =?us-ascii?Q?8hOtmjs3K1RZ5ncZrkrYwIp454OPRKcYFf86PcOGaBTMAKDsrJfl847a+tOK?=
 =?us-ascii?Q?6CTT1zV0vQxn8EYkBvZqrxgw2to9rc8ON5dtE4ZBR+/wA82AIJ2b+i5d3KFo?=
 =?us-ascii?Q?rmbeGWXOct8768lfUQN+2RKgicNeKt7DFexjRium32wUKDeTheYwPg9XqtXK?=
 =?us-ascii?Q?b+eoAXiXFzp31B86H56D/ASqMvEJbzBskjJ0qO46/2EnTs9aHBeWtHvuAlVC?=
 =?us-ascii?Q?hu682pEiA07/HqK4d5F/riZvPCnDoW7BbfViblzza8oZrOXldTMQL6Bd+cpD?=
 =?us-ascii?Q?Md8Rh74FpaOeQzsGdEn/TdX2d2mzZAibuNVH4I6BkK51KOIP5uojEGcWgmp/?=
 =?us-ascii?Q?A1+gNtncu541VEf8TanFMZztJmWyquR2oWCv9wnIhDgXGX87xn81+YzSly/4?=
 =?us-ascii?Q?UM0ZLpXnnVuvRvmiYRikW/qf42OqDkn+ukry/OvIjDhDEwVt6SX4VgiFJJav?=
 =?us-ascii?Q?uIyFX+OFrWCb4OenGRm9SiKhgtMZBmRvZx+VB0fA49Ba3tPoLEOWDdMmztJ8?=
 =?us-ascii?Q?++8M7ZTPQs8MYhH87q/i/StG9ySRTiMnyS/VSX1d+zmTKvKOBjYyN952NrnA?=
 =?us-ascii?Q?QAcCT+dVN3yqBSKOIIGZ4uKtp4jkecIRiRlh7FnZ9UNbb5ske5AHn6tvuSXa?=
 =?us-ascii?Q?4DkxS7l3o6N0biRX14iVBm5At+JyWxL1peNZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QUWlgPj4NfOZDAI1MXmyRd4n5Ct8/Z9wfVIM8W5G9NG7O/32opqCkJE3+uuX?=
 =?us-ascii?Q?gFrgZqbsS2W0Rh3SkxcEZxIw2n4DB99DF4R84QZaqNvttNXKTmf7Nw48vlEV?=
 =?us-ascii?Q?8x1MK0wT6Pgu6zmxOSaRj9e0Oo3oDGBIlXFdRmH7qJPy258qlAH6gfsQS+gk?=
 =?us-ascii?Q?wJmhfgpinjnhawPwk7SaTWTdABDkMhzsHCs04EVqOYau5LzsBQHpUx5SRghJ?=
 =?us-ascii?Q?T0iRFJno8QNIzfEioRUDOID0VU5EiWTy39hhAqYP89aF+LJq2sv9aVmWdnTJ?=
 =?us-ascii?Q?NaZykGgksoNlzY0VCjc4tJ7KzzbydRCnCxN+IglZDhOrrFOKZP2jKYgRNLpE?=
 =?us-ascii?Q?3T6qFW685mm2FPkoYaTleFmXbOu4wr0LSyGH/uxaIFOJ2JxTsWqe7kLqm1BV?=
 =?us-ascii?Q?kUQ67gF4fa4KJbi1owlNk95/8UwJ+n908wiewJ6fQ3ClSoycbTDtuGAlyqVj?=
 =?us-ascii?Q?+oIdXO+CkSqQG6w2iNgkatbSKdcMyIDyDpzgJAQqHHwfgbOAHzgcR+7y85lS?=
 =?us-ascii?Q?mUL/cwwsW3lu9drifSOGmSrdjPq+tG7Q37aZiaoSTgIsVUwKW+Djt/VbMXv/?=
 =?us-ascii?Q?kh4vKyNnNc/mlmMaoQki3WioAUsLm0tR/G11IShbBc9MeKxkqQOcbAzUI7IQ?=
 =?us-ascii?Q?Fs+0nRK7Hkl0LcS/EsfLHg0xDshV8NPzMWqRv7miJ8yXVG+zPuo4CWP3Z8hl?=
 =?us-ascii?Q?Y+utzDufKs9nWSrt4N7KDSpotKy91/8j5vM8/pjY/akKggh2dPbagQDgE6GC?=
 =?us-ascii?Q?CpYdg7ZMm9o562XaY9V02lmQr5nkYPLBGUDPUxlHthIDJHJYPDEBtjQE8l7G?=
 =?us-ascii?Q?1RlamgXGz7nTp5y0Q6RVaDyxDd81htwPKj5sXfmMoqR3O2H+u61Zyrgm7cAx?=
 =?us-ascii?Q?qOntOHtaF2kCVoytUBJ2UMxQA7vOZKx80BlTwLtTUuc0ZtOnZaXE+IMC6OID?=
 =?us-ascii?Q?PBbaLf901SNSbOmQakUElfP5tCBvOS+WXh59/VVWK5mBjrpNLziN2piq/VLc?=
 =?us-ascii?Q?9TdDp/V7YLUip+uEGGoogQB2FJt7abdB7zMwphT5Lpk0stjDAx7xlM+H0bYk?=
 =?us-ascii?Q?ecB/lC2ZEEI995x0yjgr41/c0lOdibnGyl+BUghpl9q1quPlAaxatL+fgkYl?=
 =?us-ascii?Q?0iOHp31qHn22MDbuMP2gdkKI6++B0Wk3MgeSsID83DmXVZj3Tau211RhNPkS?=
 =?us-ascii?Q?s9Roxlegde0xlhO3iia4D0D34Iip1ieDMt+u9YtICNqtIGCplPgyeKAuwU6Z?=
 =?us-ascii?Q?ShbpHNZLmQnyK4Hw62xhPTyKe2x3rcrUANmq0L/h+TlulYtn418NTT9573fy?=
 =?us-ascii?Q?HQPLpRY9GKh/1mNqIGcStf9IUog2AyZGUQLJXUToAvw09NzUKMWtthLpXKPp?=
 =?us-ascii?Q?v12/PMfcniOjrd2rkWKJ3KSZt1lFf7Fjy5wbfzFPumibTRHD06d8FRjp2YMw?=
 =?us-ascii?Q?x94lob9dLpu+MsQwF41C7u2tDaBb6nImZWXOAqV4fvrkq8dor7RJCb7lbHZt?=
 =?us-ascii?Q?j16a7uNLQGJARlyTl8BCUy1A32sIiWl6nvXvhczOW8eho+Yl0hVCY/lbzWGT?=
 =?us-ascii?Q?zGzlNT0myIsouAgg+YJZr9VponWt6K7VpvoybkPOco94ft/cHpST/RVvt9Gg?=
 =?us-ascii?Q?1ETOzSvGOlrWHy8YshK7dcA9Qca9oUokTb7YjLs3oR0GLFaaZzMhUWmoLFpn?=
 =?us-ascii?Q?hmh39PpKTEJSP7osBOE/BAViCqRUkiwIREUgUKvis4KYO48wX8LYESEmePHw?=
 =?us-ascii?Q?aN0ylrDdlqwiHQaihJAEn43h/ntC10Oe7TWv+m81ZrVIX9d6aoaH?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d557dbd-e074-42c7-0b08-08de47bfffbd
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 16:25:09.1263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xYJDXg6aJJfgLjH47j1isN0n/o7O4YbgVyn2SLVsTn3UDdPGrH+ZWrwd7LT7FloPkR6TIJes+1YVm8P6Gpiz0LduxFA3OV7zdFvGEyic14zVcxxnVEvTctILJffZgVn/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB16231

Hi Frank,
Thanks for your review!


On Tue, Dec 30, 2025 at 10:44:02AM -0500, Frank Li wrote:
> On Tue, Dec 30, 2025 at 11:39:36AM +0100, Tommaso Merciai wrote:
> > Replace individual devm_clk_get_enabled() calls with the clk_bulk API
> > and store the clock handles in the driver's private data structure.
> >
> > This simplifies the code, and prepares the driver for upcoming
> > suspend/resume support.
> >
> > No functional change intended.
> >
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > ---
> > v1->v2:
> >  - New patch.
> >
> >  drivers/i3c/master/renesas-i3c.c | 42 +++++++++++++++++++++-----------
> >  1 file changed, 28 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> > index 426a418f29b6..8ef6ff06df90 100644
> > --- a/drivers/i3c/master/renesas-i3c.c
> > +++ b/drivers/i3c/master/renesas-i3c.c
> > @@ -259,7 +259,8 @@ struct renesas_i3c {
> >  	u8 addrs[RENESAS_I3C_MAX_DEVS];
> >  	struct renesas_i3c_xferqueue xferqueue;
> >  	void __iomem *regs;
> > -	struct clk *tclk;
> > +	struct clk_bulk_data clks[3];
> > +	u8 num_clks;
> >  };
> >
> >  struct renesas_i3c_i2c_dev_data {
> > @@ -276,6 +277,10 @@ struct renesas_i3c_config {
> >  	unsigned int has_pclkrw:1;
> >  };
> >
> > +static const char * const renesas_i3c_clks[] = {
> > +	"pclk", "tclk", "pclkrw"
> > +};
> > +
> >  static inline void renesas_i3c_reg_update(void __iomem *reg, u32 mask, u32 val)
> >  {
> >  	u32 data = readl(reg);
> > @@ -489,7 +494,7 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
> >  	int od_high_ticks, od_low_ticks, i2c_total_ticks;
> >  	int ret;
> >
> > -	rate = clk_get_rate(i3c->tclk);
> > +	rate = clk_get_rate(i3c->clks[1].clk);
> 
> Can you use macro of variable replace hardcode "1"

Ack! I'd go for:

	i3c->rate = clk_get_rate(i3c->clks[RENESAS_I3C_TCLK_IDX].clk);

in v3, thanks.

> 
> >  	if (!rate)
> >  		return -EINVAL;
> >
> > @@ -1298,11 +1303,17 @@ static const struct renesas_i3c_irq_desc renesas_i3c_irqs[] = {
> >  	{ .name = "nack", .isr = renesas_i3c_tend_isr, .desc = "i3c-nack" },
> >  };
> >
> > +static void renesas_i3c_clk_bulk_disable_unprepare(void *data)
> > +{
> > +	struct renesas_i3c *i3c = data;
> > +
> > +	clk_bulk_disable_unprepare(i3c->num_clks, i3c->clks);
> > +}
> > +
> >  static int renesas_i3c_probe(struct platform_device *pdev)
> >  {
> >  	struct renesas_i3c *i3c;
> >  	struct reset_control *reset;
> > -	struct clk *clk;
> >  	const struct renesas_i3c_config *config = of_device_get_match_data(&pdev->dev);
> >  	int ret, i;
> >
> > @@ -1317,19 +1328,22 @@ static int renesas_i3c_probe(struct platform_device *pdev)
> >  	if (IS_ERR(i3c->regs))
> >  		return PTR_ERR(i3c->regs);
> >
> > -	clk = devm_clk_get_enabled(&pdev->dev, "pclk");
> > -	if (IS_ERR(clk))
> > -		return PTR_ERR(clk);
> > +	i3c->num_clks = config->has_pclkrw ? 3 : 2;
> >
> > -	if (config->has_pclkrw) {
> > -		clk = devm_clk_get_enabled(&pdev->dev, "pclkrw");
> > -		if (IS_ERR(clk))
> > -			return PTR_ERR(clk);
> > -	}
> > +	for (i = 0; i < i3c->num_clks; i++)
> > +		i3c->clks[i].id = renesas_i3c_clks[i];
> >
> > -	i3c->tclk = devm_clk_get_enabled(&pdev->dev, "tclk");
> > -	if (IS_ERR(i3c->tclk))
> > -		return PTR_ERR(i3c->tclk);
> > +	ret = devm_clk_bulk_get(&pdev->dev, i3c->num_clks, i3c->clks);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = clk_bulk_prepare_enable(i3c->num_clks, i3c->clks);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = devm_add_action_or_reset(&pdev->dev, renesas_i3c_clk_bulk_disable_unprepare, i3c);
> > +	if (ret)
> > +		return ret;
> 
> Can you use devm_clk_bulk_get_all_enabled()? all dts already verified
> by dt-schema.

Ack! I'd got for:

	i3c->num_clks = config->has_pclkrw ? 3 : 2;

	for (i = 0; i < i3c->num_clks; i++)
		i3c->clks[i].id = renesas_i3c_clks[i];

	ret = devm_clk_bulk_get_all_enabled(&pdev->dev, &i3c->clks);
	if (ret < 0)
		return ret;

In v3, Thanks.

> 
> Frank
> 
> >
> >  	reset = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, "tresetn");
> >  	if (IS_ERR(reset))
> > --
> > 2.43.0
> >

Kind Regards,
Tommaso



