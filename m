Return-Path: <linux-renesas-soc+bounces-18207-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CADDAD76C0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Jun 2025 17:45:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05DCD3BA3D5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Jun 2025 15:39:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6CA52BEC53;
	Thu, 12 Jun 2025 15:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="SA2GUNEt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010013.outbound.protection.outlook.com [52.101.84.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D41214225;
	Thu, 12 Jun 2025 15:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749742520; cv=fail; b=MjQX4OpRyFG5ZNuyikdugjXScuLihzEbtJXKXdW2iSW1I7kzKQhX/UM8AzTmfxio3m8GLd2ck+SM8nqjznMuOzlhKtk6lMRiBnCkRhCd0gQVCJu5wyxpxG4KdKVhln7PFOQWgc+On77FIxBvcB1Ei1BTIptZSuFJacRZBx8G8po=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749742520; c=relaxed/simple;
	bh=bV112uCTdg36TQNL5orGUj0oOr1Hcf0G3ZO7ioGdtKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=AOdXAfOVGnITomie+JL6fZnZDxXMRFIlgeqhQw9Q/gAHZs3bPZDDOk57veMBAlIyJAZCmYjzajpL9VAvHIRQ/ynbhBco9jr5VWxNnQz4rsx46GbPwulfe0gouhRzgQwvs47RoOBwdCciFlQOux49Xt1qO0tgKXqpb/iO93vUM2o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=SA2GUNEt; arc=fail smtp.client-ip=52.101.84.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F9Qg1RimuOoW9ghsq3L3MAZezp7EAb9CzTVjKUCs465PtxznVnO/fBWdUN8wjcUBi6bgLrtN1/avN9q2tvf0UH/RXCjETdZ45seFmD/I/CDxYStvwfL7ybh9TucXqUaOb5gDtYuoLJMr6LYRDfNLq+vDz+r1ERQT2UGFpSNWdmJbG6ZgtTP9Uv7m7c/oA56iTSA+wuAhXWk6KTM2UBMXmkEG3QCJ0Sf19BHpWAncwbP8mmVc/XScbYUfYIhs5JUS10K0QMekANpJRHuj7Fxxcq0btlU8s0/he05KANIhU1fdCZ8l8aDT6X/rKcUSBR4joT3hARX65r2QFOXIRXComw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k/BEwgdwmavSnYRUHsArrLRGz3AUygLrVJMrojp++5o=;
 b=iEajiCMJl2LS1uWdxckG4x7fBtgZmJAs1YigPhMWi96ZrGXqO8uIq1ReYNofIURe3GAf3quXFOC1gM3sSCWuOYg+PRuPfPXzPVnwWQmt7D/uzuGUwxyB6ASK4P9GuKeSsU57OWSTwYJoqOkgfdB9tCvPD5vwl5xS4eQXULjMv7rKKO9plPASu5yAEk1zIAnW7WvoMXeUc43dBEwJSlVgdHaCE2O98fx1foNwNeDEOqcVNxXnXMYopM98Dg9/E7N59liI3/8RbH52zRSqH9BsodrDBry9u4sQC4e5AGTMRKVar/Pe83v6NTEd7kqm9JQ8i159qXMNjGIuk/1V0tW9YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k/BEwgdwmavSnYRUHsArrLRGz3AUygLrVJMrojp++5o=;
 b=SA2GUNEtnWW4yXp5AEleevwxcsHev9Abd/e4lwghdA0tM2ktOI5oWeHw0CoztpAbNI0jVRxVWJPRqgnwV9seG3yIono4Q3V31NM+vqxMOBayrqZ+KEXUD0FFWCS/UmV66aBuw37QNnAEwaAsUg5Bm+AJqLP6rHh3F4HzNLBwwtDjRMbJUAjpbVlP/Xp5yB4KJncOWGZJ+dhmIqiH65lTO4wPifo4HjSiMvM0TR4ZJQ+aDUB92LfU/ownk4xH4D9fjl7i/dzcVDPBopf3OYbQgmIZXYmmx0YgsmO9OyRPewhp1Z2whA01CHgzE1AOXKtOD1r9Gt9zyVNlY8ColvNnBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by OSKPR04MB11391.eurprd04.prod.outlook.com (2603:10a6:e10:99::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Thu, 12 Jun
 2025 15:35:13 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8813.024; Thu, 12 Jun 2025
 15:35:13 +0000
Date: Thu, 12 Jun 2025 11:35:04 -0400
From: Frank Li <Frank.li@nxp.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 3/7] dt-bindings: i3c: renesas,i3c: Add binding for
 Renesas I3C controller
Message-ID: <aErzqPncG2zyehCD@lizhi-Precision-Tower-5810>
References: <20250611093934.4208-1-wsa+renesas@sang-engineering.com>
 <20250611093934.4208-4-wsa+renesas@sang-engineering.com>
 <aEmjbY8ifoI5Cs5t@lizhi-Precision-Tower-5810>
 <aErkyDQvV3C0TZSu@shikoro>
 <52401543-28df-4f13-8b7a-6463fe54cd5f@bp.renesas.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52401543-28df-4f13-8b7a-6463fe54cd5f@bp.renesas.com>
X-ClientProxiedBy: SJ2PR07CA0002.namprd07.prod.outlook.com
 (2603:10b6:a03:505::25) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|OSKPR04MB11391:EE_
X-MS-Office365-Filtering-Correlation-Id: 15cbf52d-dd8c-4e25-8458-08dda9c6b964
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Vw70gw+mEefbUz8J1IKcwMoC+OLlXjXI+s9Tg9oRZujEXVMle9iAQxEIvtMq?=
 =?us-ascii?Q?jFc9x1R3712T29a+rp/VqoFQt86+Dzc3s3htU2nkil5AWTj60CjjgbJLzryj?=
 =?us-ascii?Q?lamWsTz0d9WREtJLILGsUK4wt+Rcgiy9LRvj0ZaVYwTPFOeHiDaCYwVPx19a?=
 =?us-ascii?Q?G/1AgAdHsCViFWBhSJOsknuAdFE2UwzQxMcSdAwQdacb0FtH9dfJOE9gG39f?=
 =?us-ascii?Q?hOQU+dgWeLbi2naUviVMr/uG3ylbSIvzxsDjlBJ+bW9CIfjHp6QFQ3WxxoAL?=
 =?us-ascii?Q?mXOZRKp4r2xyUOB9ogc4bASQR5OqvxQDvv8BHy1NRFeACqYE6+/OYdVrlk7M?=
 =?us-ascii?Q?QKFQn2oXwkb4wbLF4XBA2sO0mkrJz30IaZIrjeM5wC+8M469+KoBj9r23Kg9?=
 =?us-ascii?Q?DUSywOe+VxwYbOjmficJLfV9l+LwN+PIRwq2E8OjOR86lbrVbx3QzvQdERlr?=
 =?us-ascii?Q?YkoNQPIpzbXiDb+MVF/CabWqhqP6wldQGQcJJ3EuPivqKCDH0y0BACXj6hzH?=
 =?us-ascii?Q?PKzZwYRsN8krFmDjnbSpTnx3Vp6g7oMgK2NHWYA1Wzjmiu0vllrl3nFP2a7G?=
 =?us-ascii?Q?1/xjFKxhK1CuQea3yr/RlL9RnY1rIK2M3xjjCMyExZ5U62r/Xzysv96GW8Rm?=
 =?us-ascii?Q?ItfmYgn+E3aC/LWaYdd2JaNr2FGIGxi3OinnH1mF/6Th5qXSmhAT5GFOES8c?=
 =?us-ascii?Q?XD9cwV6v/zfTl/3b7Bsh2jiqMfqNvavT9Icj+lO0U+yJN4svtIdUJTUQX9Nh?=
 =?us-ascii?Q?7QTYHwagWvS0JbBdof8nh/JNTwkrC8jay/oi+2mXn84phdiR0GL+NqSdqr8J?=
 =?us-ascii?Q?i6XQbc5pNqvLCBUZD/23naCq13dryunsYPmaYq54k43hfSETKcj0Ik5CXdEM?=
 =?us-ascii?Q?rE7Dh1Y1fhc24MIItxTg0r7YNZ0aJ2g3lvnhNyc4a6XmvPdDuT8nDya6+2Hv?=
 =?us-ascii?Q?vZ3Q4sZhJ5Jtpndh8pUO20SP6/FrGGFazN/sp1inAvtV8y/ld/q5i1wCDNOF?=
 =?us-ascii?Q?Q2c5tpjcr2/uT1rW0UeZVd4qDFVI20QFB9l7x7e1vpVNwPJN86SapBMQqGSj?=
 =?us-ascii?Q?xQcs3CRqfLQ0sorKnvjc6KRy4VmBoldcfy9vHB2vQqJckyx1PmZCILcQ+S7C?=
 =?us-ascii?Q?8RsbyE87Po1tY1y7NZS6rv7UCJogUyPNapnxNPQd/jfnd1RcDj3M5dLRf4u+?=
 =?us-ascii?Q?CVtRl8h5/JJpM8opFaIrqlvgCQbL/14WJUzmyrPHoKhKXbwXQ04v6opgUUo0?=
 =?us-ascii?Q?gUZ6mIP7Xr472VZs3ueuTd38Jfx1VJjZZghfduY3dv0BbndLK6r1MwCOGZBl?=
 =?us-ascii?Q?fc3HFLc6UI8Yaev7XoydNVNj0h6JNW/2KhNbk/5YPZF+I4Ou2ZVXBdMuZaBW?=
 =?us-ascii?Q?FUsB2mS6wejMz4gJLVnZzYZ33ZXHQEtpkq76s0LdNvyYlQVth3YiSyL5CaRE?=
 =?us-ascii?Q?r9WDHbeHVLZghbXFbQEaf+LMPYrQEfBMLRVREKO4zSXF9ArZaICEAQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vcDVJgxj1hm6ZxPhs/uQdH/yBjv0Gw7JutrhShlRX9mIKBpnT2AVbE6+xsbb?=
 =?us-ascii?Q?H/JDNawl0DTp0kiRLXxTvYd/eBQzf3BMiacHBIMHN7l5i/xOPWn939Hni1lC?=
 =?us-ascii?Q?ft1nMLtHL/0I4UAYkHDl5faxPHrVAPUU80TLn3n6I6v4cVLE3eVovo8B821J?=
 =?us-ascii?Q?EWQknNsOxk3IHKEi+vhwj27jReN644CfklM/B1rHUFMW+A95Id90NH0PpCXs?=
 =?us-ascii?Q?C/2+HZMeGi79Vr8b3yd0kGfbU4q2LhY3yf0oC3ZR1c4hL/yiJvBDXoSH8tMG?=
 =?us-ascii?Q?amCFOsRoSs3eZcuX+eOH6ouYQFnul+mhQWIoVKi2BVwc5V0dxXn+19K3eP41?=
 =?us-ascii?Q?UTdHM8VmgtqSEhIJOv+02hwZgga4WMpiHzkDuOn0uO9uo0rAjhDsnyX1GXI+?=
 =?us-ascii?Q?pDksD7DuqjXLylX0xiiaLBqLSNu6VZI5sqKibkTWyotjQIFdlIIEZ8Qc/8Nd?=
 =?us-ascii?Q?p2HeDhBcfjMe0rNk1DtqrttkNrFDTVFi8qBb+W9eNRp9kp6QZG5mldvR+/Yy?=
 =?us-ascii?Q?p/sRbJA0FXiVclS1pgCXHCP4By4YyzLB613LfQgny4RdJugEqcupvtEOT1nr?=
 =?us-ascii?Q?DcI4UcyyDBLqYF2TMLnBL5OcuUQRbKofSxkVjT/EPXxQP7rzkDXZAhv2SpGs?=
 =?us-ascii?Q?Ng4O8FQZ+jWq+zxMSWhKCt1GrAsPEGHOPTCM3+Wl12Ae0TLFw6TLpym6d4JQ?=
 =?us-ascii?Q?95SbOb5pwR10fgGDe9x02tlNKeEw/OlY8GCpayWjhJsWJ/BNqzm42NQ41zwO?=
 =?us-ascii?Q?leWsNUjFtCWK7mEwE4+QTLSBQIE3WG6H+1wOApTvZMGV3u76U6PWsGsvoghU?=
 =?us-ascii?Q?wIvRUtYkGDjX9l7lFZ+mgkX7S4CAzQDL4F0BFfrbHXU7Ig1mPJok5wdxJiiw?=
 =?us-ascii?Q?q0rB3G7M6b61PN9Bs8OmsrtuUPZreUH2dAWTlD22TN50RhZkBIQSDpffjG90?=
 =?us-ascii?Q?fs0P0ZUpmFtT23rXvXnKyF2TvsG75HH3mixru64w5Jk6ipkUJ3wpXS6AtT/C?=
 =?us-ascii?Q?BjCkcL3kuDt3W2Cunt7TNzmwKsfca/lPf+f+8adlkf0awCmrRtEgy9RRlw2d?=
 =?us-ascii?Q?GjnSmfbiLu7yTGVBUgCaUeC8igc25gwGxU3Pd9k+j0DFn0b45JACyGm8xz+D?=
 =?us-ascii?Q?wQqVZk5qoTWgl/ORDgzH9sYd95bH6YoVmDXyF9AnMGlFzJRyxTjaCM7Cam0H?=
 =?us-ascii?Q?pSb9lTZ3i1g8g/2xHnM8ie5HHSpHT/3683dhqs0DFprd21ZFXGxe016ubtI3?=
 =?us-ascii?Q?jEhfnZmrru/G7KUBci7ICcEctYcdqTh4aZtoDN2hEIe7arpWSrrxOyoDc907?=
 =?us-ascii?Q?KmTXMx9ktDRVhrjK94roBNyemRKuL7YP6okIRJxIGKWnt6Ql/njQj2bJ5v8Y?=
 =?us-ascii?Q?IZJRAbaahoyHoozPTP4dlPR6gBNYKlZ/EGODuhYUBOEl8YZnqc1afuY0Vtg8?=
 =?us-ascii?Q?z73Gv0hXexHkeA4sj66zfckjeVuY1BtcpAMGo/AlhnpuWkGBAzHKwHoJl47/?=
 =?us-ascii?Q?VWPYZVBe6gIiYKi67xz/2PR8wexYq37dfNox7drGtQLO4LT4b5Osn3p4L3vP?=
 =?us-ascii?Q?nkLb4BZAxCkffDW6mFnYnKFaM6Y7TLMo/+SGQV+p?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15cbf52d-dd8c-4e25-8458-08dda9c6b964
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 15:35:13.7316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o7XqcaR+yOL9lSp7wVxDJohTfL5glpmMXJXgzb15J64/bMZCfl6POkAZUogo+mCGnpchk3Y32tJhvvIqoYYEmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSKPR04MB11391

On Thu, Jun 12, 2025 at 04:51:42PM +0200, Tommaso Merciai wrote:
> Hi Frank, Wolfram,
>
> Thanks both for your work.
>
> On 12/06/25 16:31, Wolfram Sang wrote:
> > Hi Frank,
> >
> > > > +  clock-names:
> > > > +    oneOf:
> > > > +      - items:
> > > > +          - const: pclk
> > > > +          - const: tclk
> > > > +      - items:
> > > > +          - const: pclk
> > > > +          - const: pclkrw
> > > > +          - const: tclk
> > >
> > > Suggested clock name is, apb, trans, srfs.
> > > Needn't clk surfix and provide meanful name.
> >
> > ? Why can't we have the name from the datasheets? It will be
> > unnecessarily hard for users to verify the correctness of the clock
> > assignments if they need an artifical mapping of these names. If they
> > are the same as in the datasheet, the same task becomes very easy.
> >
>
> Agreed.
> Since the name comes from the hw manual I think is better to leave it as is.

Previous Krzysztof give some feedback about clock-names, they don't perfer
clk surfix, because clock-names already provide information, which is clock.

Some hardware manual use it as signal name, for example, pclk which is apb
bus clock.

I am fine with align signal name. you can wait for DT team's feedback about
this.

Frank


>
> Thanks & Regards,
> Tommaso

