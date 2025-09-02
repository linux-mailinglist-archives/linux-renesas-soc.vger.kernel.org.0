Return-Path: <linux-renesas-soc+bounces-21199-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 88482B405E8
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 16:02:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 67BE01BA04B4
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 13:57:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B28142DE6F1;
	Tue,  2 Sep 2025 13:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="kT3TdZaF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010038.outbound.protection.outlook.com [52.101.228.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298B1212568;
	Tue,  2 Sep 2025 13:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756821259; cv=fail; b=NsWp6Hm4WEhFWrWe/CBadzFIba6NqcAIDoiW1QeoRuk2NZP+1mjdmi+1gW4hwKvbQ7K/flnfrYRSZ/aTXr6ZdimwZnIISwmGh7xHe2tZhLuFhiG7LMKaAYHl5kpZweWmc9QBS8As/tjJAwD6zugKeWq/kLj0npoAh35vHmo/JEE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756821259; c=relaxed/simple;
	bh=T+9e8Pvji9kvQDCK0GNBleiJs5M5r+k8UKM0zIg+9rg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LMcX4hIIRbqC0OANlqOQac6B/lpU7yqW92eyI3K6ldL/sKd9z4eQFx9K6NdHbSnXxKfbNMCCenDMkzxkuvX6VuAwQKhJH76ITbpIJJdyrcFpW5JzJFa9Q3jY3Qbagb61vnYeS7N5EIR/oE2idB3OOJP1PkbVn62JUJq073Qm0vo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=kT3TdZaF; arc=fail smtp.client-ip=52.101.228.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E+JDxT+4MWZ6ihzqfwO18aFpZxMEvXE/IRIjftfDQQMd/1ppRhNXhBd21+7TYK7CTSBUIzACBzWW3RnZsk3zGfIqp0+AmSbbqO8Pe1PTizAGFIrxLszu+cI+gNzaC3lhUHuZYIW2/oeE6BOXZFc8sp6mPGotuud7Rz80Gqk5yGpWekWUzEbtzeH/fPNceHxkjexPJAOo4qf/o/Z8eXkeB+6l0WTWjt1yNRVmAgDKdkyrqX7InqGzV8A4bgeWH8Bn9OHeHh21QV8cGDXBSxNb5C66No3GpZG5fk6eSpSpNR4iKbxmFKsy6kypxSQywcLy7E7g39mRz3bqdXax9QsNTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=35O94tvmQhhfR+GsP0jKHKeE5ktp4SgfNZSr5LOn9JI=;
 b=fQOQ4mH639vyOH3qQTW5TAv/4JIkJYEHxR4O/5T46lSOCzKBkWwWd6NsE9fCBbP+87aUAFnwY38yjUt8Yzukrpieyq039kNjv6pBfPcJs7xLctWsPrQXLe1ixRyWtSoRpqhZdu6fgzybgkCAJWxb9Meoo2mrUzFI+m+YW0Itme+okrwbx8rz1ux0rszSMG4afJui/NUg8t2Tilc4tXZzYtBzXfLE3F+qLagq5KLTEPjbpp7/Z8EbhreEQpHnSX15GZwSwnQpxp7Es4f+yW3ZSyBNRhq2phhpAurDOCZpFLMUXQlwt1yZEna8GVXr3OsVmtF4n+ZQ98LPwlQSy3SSuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=35O94tvmQhhfR+GsP0jKHKeE5ktp4SgfNZSr5LOn9JI=;
 b=kT3TdZaFNC5BcPcMxd7KBdwuVzaOUCzsrOzXQkojPzblr4BaMCGRcuvfCCQsdv0c2ByKx5LDfFyxVYnHi7dcf0rKKVnvuJJlG72ddaQOU5hP68BS4WHoLZI23u28h8/fH0bXQ+DDs1LxRRvvX2/1+doZ5A1JfW6IqQBOV1UEL+0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYWPR01MB10362.jpnprd01.prod.outlook.com (2603:1096:400:24a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 13:54:13 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%5]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 13:54:13 +0000
Date: Tue, 2 Sep 2025 15:54:03 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] clk: renesas: rzv2h: Re-assert reset on deassert
 timeout
Message-ID: <aLb2-4yQaJiuAQeO@tom-desktop>
References: <20250820100428.233913-1-tommaso.merciai.xr@bp.renesas.com>
 <20250820100428.233913-4-tommaso.merciai.xr@bp.renesas.com>
 <CAMuHMdUC2w_EjBt1D8dqDkASo6xB6TUiu2FpX9tbx=zz+tN=Ow@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUC2w_EjBt1D8dqDkASo6xB6TUiu2FpX9tbx=zz+tN=Ow@mail.gmail.com>
X-ClientProxiedBy: FR5P281CA0007.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f2::17) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYWPR01MB10362:EE_
X-MS-Office365-Filtering-Correlation-Id: 9afbae61-324c-4a03-a960-08ddea2832d1
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jGZq12RxoXGPw+FfZ0z3V5Uc6Av6Dgddg5n60y98W6bHqkkCUNh3WniDaiWq?=
 =?us-ascii?Q?Zd/rsMdmmaqLEf9K9b1Ql5UpIP/iQ2ED3tTdaaQ0Uz9Z+Zf2rYbRKm6Ywnj6?=
 =?us-ascii?Q?OHlvRHOrjV9pAtv40sWlvHtDxkFYuhcltC9ACHp5PhLn0xPASFVmHo9270fr?=
 =?us-ascii?Q?TBV0d5V4CCHO0LGnD4Ca9S2DbCVROtaCSyHsIlfH8rNLR2+j1dOaMAhYKH0L?=
 =?us-ascii?Q?5ny4TJWHO8wL4o5+yXZcg/a2iewY0+4CRyFQCOYZ0JM0DzMEYhkwSOyIZzg6?=
 =?us-ascii?Q?UG+4eyRSUsIyCWIesCX0NO0JG/xOqTrLCEgKPbDf8wW2NHJzx3sLB6mHollT?=
 =?us-ascii?Q?1xDdBv0sYn02VfwE5wUxyGnfZ3geRIsumL3lB75EDKaNcq/QHBkz2X8gxU6l?=
 =?us-ascii?Q?2JohlOS8rH+xynahR1VTaw23IWhSP5DasUZPbl/A80szrs0dHAeemctRTIhm?=
 =?us-ascii?Q?w+xNvywUQy8lIkpZuSaMgXR3w+Ef72cwcdIr/MLSWk6Pt2NHvvUh6G7Xllv5?=
 =?us-ascii?Q?+ml6Wdo3mw+kxOUgQJ3PXkbpexTYQ0PB0gDt980K/26zmD6eJG++Iu1dPe8Z?=
 =?us-ascii?Q?m8Gl2i8SwkUNrnz3YjLaxQ/Nl/7bEMFmUe/DYiGMRmGI/QgG4XYvl17hHNY8?=
 =?us-ascii?Q?n+SeweOraq21UFh9Nymicj8TIsASh+TRMHlkCBX1jZemsLqnypo4Wo3iy+fx?=
 =?us-ascii?Q?PDakC3nWTC6IM8syyi7JL4u2Vtx0IIIPHej0JL8JwcwjErdv8bESZ0HWKyZe?=
 =?us-ascii?Q?R2BgkptYA8OCREL612A7sGU8+txODPamgBJqmF4QacSvFw2e8WSLwTHXE+0F?=
 =?us-ascii?Q?x5yTTzheI0nD3+6oa8czlo84PzOIFRNgisnzkIN0OfoX2vICUW+gOyVQG1lp?=
 =?us-ascii?Q?+cOXksL0M4gPOhxPhQYtzrddNAmlr29GPHVsbqoyFXCvMyEVdNNSxfjX/2Tc?=
 =?us-ascii?Q?XUixe61waw7VLLMzzqYn5nwD4X7UVAyjajUfnC5FhQVacH88As8kCzljgTpo?=
 =?us-ascii?Q?0TrXABNePDUc3AomTCSdgFoaATFBW3UBO3Sei6qb9EisWX6A9arDDBnolPAQ?=
 =?us-ascii?Q?9qUw8aAguvTQ1NcY/mhrRcbXbTfE1jCeWjZwhrwMkStiShqdqK2qkSA7vf7S?=
 =?us-ascii?Q?vHEPtRjpR/W5hA6fc1T8nAYXXcvMlZxWx2LLJG/mdcrJ2B+o47A3LAGmkuDm?=
 =?us-ascii?Q?MuW98seMxvp2+qzHY2KQIG898bArFdJzwHVJZqHegiYlZ4I4BGVKZ12XbP4k?=
 =?us-ascii?Q?AM4KbDUr55MMFr/W787tANLyrDwOLI7cK1FZZ4QU6SjdEQgdimxuHA1TpFVc?=
 =?us-ascii?Q?CnUCnR7sapohT/kddzb+8NJxyu2+lBOr3hJ3CIcyD0WLmtvjOmJLyr+0cNuJ?=
 =?us-ascii?Q?1vH0cY/MszWn1n0T9pDGlNTVovL5KZg0a+blmimImRs7Fkz+Nsw8NQ6vlpaW?=
 =?us-ascii?Q?2EuWV8cL7IqpzIzRJ0SsPIjQ+k7zmc5N4dRUbcPbr3CPlWNXpW6jPA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CfibhVxeGLUybOcCWafEAZJ7/Q2BPpWaq0gPpLKdA7ywxi6NklRbkvsNC8sY?=
 =?us-ascii?Q?JAyVnCa1qYv60oqoRaHOoqxtDOTspSKyabkPtLbs51AIzHkKpiEqHMkVOSwI?=
 =?us-ascii?Q?pBAMAKgI0j+CE70dNAv5FEyCZ04oOjBRVEyKZd2hH5Ze4xFptvFjtg4uTAzr?=
 =?us-ascii?Q?caboR+pbGLRtKIXl2nO45Nh6TIL0oCUP6e/48ZGcMRNUlS46zpBrzHGNyrDZ?=
 =?us-ascii?Q?C/gNK0qJYNRlaGaO/8eKgm42V12qF9WwoAbBy7a08Qqw/UFsCmwuQzLedi68?=
 =?us-ascii?Q?Fm3OIq5Jd619MWtgj6k9xE2heta/UGJQAdVGDk4RdEFU19942uiLqvoMZKaA?=
 =?us-ascii?Q?f9/i8YpZ9rAH71twSlH51tuEp4SpmUFkt81sSni0PiStqYvxEpSCGlvUNP8K?=
 =?us-ascii?Q?4f5eFa7bXc1zKI91UW9o5oqME+PACChMv4B8cICRrOC2PB/fdvCiIz2QPlDm?=
 =?us-ascii?Q?au4pt7Wi3rqa2yf4E9Oh6M+Fl/3aA/aWfDfCgUb29Q5DFJXMIUiOweOSYBBp?=
 =?us-ascii?Q?eWQ+7ugykQD79WMC99W9DVxs7TusQuqNi/kjG1UKf6/QS3G3MKUly5YNGDBq?=
 =?us-ascii?Q?Ry+jXQ8EnZ8aWh4LA99EkWnK3GyEp2EH91mCC3+fEqKAHFC/i/we78w6gNUc?=
 =?us-ascii?Q?k3uSxgeyC9QKafhGvoif/tMl8e66wNg0d3jh6j3w7HdL7vEuA4CFKBbvsH/y?=
 =?us-ascii?Q?NS32ao6FQVAvxu03SfJQvonjKOPipQK8EaHVam2Si6+yienXoUWO/DFm+VEf?=
 =?us-ascii?Q?xTEW7Gx/EpKIr11qQf5cfZMfwxsNXm9ismxZUTvBfQnBN+ZwhTcxcje3Xw1y?=
 =?us-ascii?Q?uVJSOp1tsrMNnRsWaj1iHib+NfPq883moVnqU48A5hjeX+x7JiTJ2UuAnVBH?=
 =?us-ascii?Q?YJo+PeVB9ZkaYCbYmaxcvjbM/BLUaXJzt88Qxk4FsN+CgZ2RjPzb4zFLSwP1?=
 =?us-ascii?Q?f5cmZvYi6Eqd4iJqnQR0w+TenrgEgcFUAyL1DLB6quW3Qjf9tWKU91uYTbyk?=
 =?us-ascii?Q?un8xVR/S6Sht60buTs4bh/fEy351ZBZfp3r77Gpi9f6q6iq3idYLPIWMRhEA?=
 =?us-ascii?Q?B4mL28/aAo0IymfY+vmenL+Y/bRdv7rkapeD56Y4dc2OTCOOreGQntWgUF18?=
 =?us-ascii?Q?Q3TTIu6ZyzdBV7gSEyx7rzBq2JEr4WxErIGXthT3kOmpuBuweh7Z0O7i9zhG?=
 =?us-ascii?Q?O6KXDVrhdkq+ynEPHKmd6MKIsACSfj/8q61BFPQ9xYzRj7iEqafbLfDYPD0O?=
 =?us-ascii?Q?TmImUngJ4WqDMsxziGZsnvqEg8H6imgKuB7Mmns3H3T62u2WSbp60P9ZIsDF?=
 =?us-ascii?Q?jGsXaYJPotq2GnurTr8zWLUfmVmcjjzdLFytxN//ncVRLEFlL5FLJxYfX9xE?=
 =?us-ascii?Q?e+N2Dpcr8Qdp/zAg/DkxljQg1U64UvNgd4WU6ZXFiDCd1v8XnJBjNVrCwveW?=
 =?us-ascii?Q?VsI3flJeaWLpOey6XJEiOhXe25Ap8lkxWTso64uS+ah75TPmF/g36NQsu+iw?=
 =?us-ascii?Q?1PUgmxMj0jxqOgCXjMqtCnD9WbLzvvTl9fnObUTQtgPMROeMhfJciBEBKnmk?=
 =?us-ascii?Q?VnzVQ5M+Zg/ag133ZkJqr9YeLn+oF9RdEQlgLUNyidh7mOxFTV3I+4Utzkd7?=
 =?us-ascii?Q?W3J0TsqXCLuVux0ddi2TboQ=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9afbae61-324c-4a03-a960-08ddea2832d1
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 13:54:13.2160
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d32r8t+V55fJYuNXSEdV7NAv2GfmVLY3Il8lTuqxwyRXbNrJm9sCTo25FY2svIxm6M8rJ0z5HSHuZBfwXorRZ4AS0a3StSX4Cuab12aT3pixpXymqqflaLEyMoxs1X+m
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10362

Hi Geert,
Thanks for your review!

On Tue, Sep 02, 2025 at 02:19:16PM +0200, Geert Uytterhoeven wrote:
> Hi Tommaso,
> 
> On Wed, 20 Aug 2025 at 12:05, Tommaso Merciai
> <tommaso.merciai.xr@bp.renesas.com> wrote:
> > Prevent issues during reset deassertion by re-asserting the reset if a
> > timeout occurs when trying to deassert. This ensures the reset line is in a
> > known state and improves reliability for hardware that may not immediately
> > clear the reset monitor bit.
> >
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> 
> Thanks for your patch!
> 
> > --- a/drivers/clk/renesas/rzv2h-cpg.c
> > +++ b/drivers/clk/renesas/rzv2h-cpg.c
> > @@ -865,9 +866,16 @@ static int __rzv2h_cpg_assert(struct reset_controller_dev *rcdev,
> >         reg = GET_RST_MON_OFFSET(priv->resets[id].mon_index);
> >         mask = BIT(monbit);
> >
> > -       return readl_poll_timeout_atomic(priv->base + reg, value,
> > -                                        assert ? (value & mask) : !(value & mask),
> > -                                        10, 200);
> > +       ret = readl_poll_timeout_atomic(priv->base + reg, value,
> > +                                       assert ? (value & mask) : !(value & mask),
> > +                                       10, 200);
> > +       if (ret && !assert) {
> > +               dev_warn(rcdev->dev, "deassert timeout, re-asserting reset id %ld\n", id);
> > +               value = mask << 16;
> > +               writel(value, priv->base + GET_RST_OFFSET(priv->resets[id].reset_index));
> > +       }
> 
> Same questions as for the previous patch:
> Is this an issue you've seen during actual use?
> Would it make sense to print warnings on assertion timeouts, too?

Same here.

Thank & Regards,
Tommaso

> 
> > +
> > +       return ret;
> >  }
> >
> >  static int rzv2h_cpg_assert(struct reset_controller_dev *rcdev,
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
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

