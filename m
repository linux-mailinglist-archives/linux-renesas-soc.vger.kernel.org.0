Return-Path: <linux-renesas-soc+bounces-1290-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D55AE82442B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Jan 2024 15:53:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A53CE1C21FE7
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Jan 2024 14:53:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6F32224CC;
	Thu,  4 Jan 2024 14:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="aT31711Q"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2069.outbound.protection.outlook.com [40.107.21.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC3C249EF;
	Thu,  4 Jan 2024 14:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aWjqFFQPV3CVraJfuzEK2INKwVWpVshB9rjd1VQayIbqOSLX2jsVWBnxGyI+1iWgxvVE7MaQPPn7L2Z+iyqoAnApBlBLyNNPmjAnNgdxUlZzlOvmI57di+hgrfJZK+kRNQP768Rt6yPgkoJBfXRHE8CqnkBLEG+ViQaNnLI7qCv0rjF0oU7j0f7w9c+AXbPfhd0Pf5jHfSr+jqsLa76wIJvaRJ9Vcz3tP5UioQoatI1QkxLQEnsfZLjVEIRlseukG1HW/fC/LhNWJZQl9iGccnFxVmaQYO9mxgNIKh1dJd8aNSGwjjA+HNEIambOItkuTKLtByxkkUv6UF2quAyWUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k78EL1Fm+UbcSue1hU3ZSYVtPmdffcFvv9tRpRxOc6I=;
 b=UCCeV/CoDShkRPgCvDFgWX1wQzCZ4FGQQ9isT1/gLYWn4TrMaiqgr0yOAot4aGDISS6EOECBHrQvo67IPPwY+HKu0tCFCStpM2tbc7cHJ2Uh3LP1ejDV3Our6RxP5UsAPXWxNFYAP5EBCqqIxPBtfxfD2fZUtAxyo5bV4Ecsp1lxNXoPtyJaoU/nZr6qVLbVoaqHYjXANShrVdZHFG0F2Im1pquk79FYV79KSfgdF7ng4aMqpZUBm+OfgXeXoF3rFSu4xQZtUE8xRLOwgKP4eWWom8HKBawMumsELq9ls4uR7hWE7lFAYwe3csUYq3EwFWNVbkXdGuOvez/8oKoEjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k78EL1Fm+UbcSue1hU3ZSYVtPmdffcFvv9tRpRxOc6I=;
 b=aT31711QtBC68LO65n9TEBvNxuYC7EO+GzoLUKsXLwXQWgHZ/oUPjnFE2GPDci+Ut/sE+3LmaWQRDRfaiK/6flPmR87Vo5mPH0ddJRLZTgu5rB2SfQ4wFOy19E40jou/9fpDVrTD1hVRveU+9anWPNziEYV0HhLz8lQ/ONZaxUQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VE1PR04MB7374.eurprd04.prod.outlook.com (2603:10a6:800:1ac::11)
 by DBAPR04MB7239.eurprd04.prod.outlook.com (2603:10a6:10:1a8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.14; Thu, 4 Jan
 2024 14:53:11 +0000
Received: from VE1PR04MB7374.eurprd04.prod.outlook.com
 ([fe80::901f:7d8d:f07c:e976]) by VE1PR04MB7374.eurprd04.prod.outlook.com
 ([fe80::901f:7d8d:f07c:e976%3]) with mapi id 15.20.7159.013; Thu, 4 Jan 2024
 14:53:11 +0000
Date: Thu, 4 Jan 2024 16:53:08 +0200
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
	pabeni@redhat.com, andrew@lunn.ch, f.fainelli@gmail.com,
	hauke@hauke-m.de, kurt@linutronix.de, woojung.huh@microchip.com,
	UNGLinuxDriver@microchip.com, arinc.unal@arinc9.com,
	daniel@makrotopia.org, Landen.Chao@mediatek.com, dqfext@gmail.com,
	sean.wang@mediatek.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, claudiu.manoil@nxp.com,
	alexandre.belloni@bootlin.com, clement.leger@bootlin.com,
	george.mccollister@gmail.com, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH net-next] net: fill in MODULE_DESCRIPTION()s for DSA tags
Message-ID: <20240104145308.2nzbwusesz7vdslu@skbuf>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240104143759.1318137-1-kuba@kernel.org>
 <20240104143759.1318137-1-kuba@kernel.org>
X-ClientProxiedBy: VI1PR0202CA0010.eurprd02.prod.outlook.com
 (2603:10a6:803:14::23) To VE1PR04MB7374.eurprd04.prod.outlook.com
 (2603:10a6:800:1ac::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB7374:EE_|DBAPR04MB7239:EE_
X-MS-Office365-Filtering-Correlation-Id: f06a4854-14f7-49bd-31cd-08dc0d34df16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7LMLAGv1jkmYhgBYZdcwMdXRGxrCttjBJ9HrLGktsrXnmrl/r9LCRp9hJx+edH7MU3+s8RR0Qx65qoolYSvJErjxeHcCiqWnMOcHIr9p1l02wWW1QglIn8ZpRWCJbN+Xmc0hmxCoCeQbqIVKzOiyeeYyBTIu2i55x1UeqnDHuBBpZgloyMFRqCnqN4Mahk120BQ8EOgztlRUpkT73gLrW5CNe4g0PA3YoqxchrmRZ4g85puJ5ZsrTA+8GdmbHiLlZVDQ0kqP67NNuzAKV2teMjmaV4DH3bPqeUXKEiJq9jt2p5ePDvEgD3FZYA83gpRJM7do9NQ4DKJFX+gJhvuFIFc3q6fu9kc+dlzSCX73iRtrjkcbtlZNlLE8pwNrglmX/+a4MtMPjYi3zAXwB6rDq8ThNzJoZYLcn288Dz9ySzpAbNjZRnYeoJtzs3n9Ucjkvzf2oVRWgx++kPo9pkOzgPsZrxLF1aZZGFz86CcoimjHsYpY/n7H7qlb3yTKFU7z/QcatnDPs+lpLC0Okh+HT+QUldks7UFiSFzTVkggYnqbJTV4FvoA8HI6MkaNwszN
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB7374.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(366004)(39860400002)(136003)(396003)(346002)(376002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(6506007)(66476007)(66946007)(478600001)(6512007)(66556008)(9686003)(6486002)(86362001)(41300700001)(38100700002)(33716001)(26005)(1076003)(7416002)(4744005)(4326008)(5660300002)(6666004)(6916009)(2906002)(8676002)(316002)(8936002)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tHQ3xbJL1aS9zW84g3X960zHU+5qjKuaFKhfjoqqidJiZOutXYsh6TXrMk17?=
 =?us-ascii?Q?G7rr05gWdSqM8PP3lJlEHGVKjhYXCNglXwiZAHPI8Cmzs/9VusX3w1gzaIZh?=
 =?us-ascii?Q?1jOh/7VudZRBlJ3W++9ehd+EHs0F9p2s5eRmjjOsQk24NRnB4H+lP3zk9XW2?=
 =?us-ascii?Q?HVoxpP5Y0kppaBNQhnmTCEVl6h6prPxlLZM8/xsQeViODQ2Bcu/TMtXii99L?=
 =?us-ascii?Q?jeMA24+a94tzRoA6VNrNFOxkIU4pwPwJbjZ+AaOfiK5FnBTfvAQ5PGwvkqBe?=
 =?us-ascii?Q?YA8HLC3QKY8xqo/oWwEZALEQvcjwsNz8CMDDlFaBHCbKeiYXqzYkFhvvkVJQ?=
 =?us-ascii?Q?23SJLyRzgFc6sSTYEZ10ybTn2d4Rhnu+OY/fXmiEo9nj9mQWX/ZPjytKIea2?=
 =?us-ascii?Q?2Tnqk6iw/Igq63F0HABdMXVTS8LsImI5iMdGFp3AvDdI8AZrSU8bd10CVXtG?=
 =?us-ascii?Q?Sl8tF7PjQZWrBAxKmOVvnALm601PcKeFpznjle++o9gcdsIpj8QBXJTBQiEP?=
 =?us-ascii?Q?qyLUmyZU149tZtha9nlqSfTLtu1Ki8g83n4laavzlIuLZdHEWmR3UyIfocc3?=
 =?us-ascii?Q?w+WAnIYvEpe1GGBXao8UaWPU/ZnDj5Sfk7vja9NGX/96/RuAs1Zq7t06jt3K?=
 =?us-ascii?Q?Byz1gsXrNWI9yQupzMsdNW9nFSQ+Tg6nR4B0XlBW5SoFA+r+ggpGGkgLkPnK?=
 =?us-ascii?Q?sBAZcCIvAKsC6TUKf33qtm8c8P31jDFzdKb2Ka3YmmTN3jYm+bIU6orsC2zA?=
 =?us-ascii?Q?YXlNR1RkO3TC+Lm7kUa3M43Pl9xZIE+HGUtIqhUQreAXSZPa9SJckT097bS8?=
 =?us-ascii?Q?ODZpIzI/ZB7XSnth6/kBj99X5Lh0Z+Io0/PQBW1MUoVbM66irqZoO71F727i?=
 =?us-ascii?Q?kjfExKFm45iUlt8ZP2b7uNSkbgpZJCyuCnRCuO1G/tvFYWncf8VzOmv3vny9?=
 =?us-ascii?Q?G6a+xAhZhrQ96EiVMWdJuJTGUqTKemy7ArPkUOsT4h37WCdZN/zVac+pds08?=
 =?us-ascii?Q?MOw48Ogzl9sfaI9zg4Q1LOQK1/B39MXdXvW2q3IXIZDMwWqf4YgWQbEXFTOs?=
 =?us-ascii?Q?wP7kzTz0XYWOx/OPNv0IRy6MuBIvFXWkYtO1KRLIoXgoQByfJzys0Y+etEpa?=
 =?us-ascii?Q?cZqKJjbJoIfq853uGbNHRMn1QY4Nit+Bh3AvESgB5oWKZny+HL3ZQGXdCabm?=
 =?us-ascii?Q?3n2+Yl7985Qdi5taa2jmRgEPp0cuNCY0XEv/gaSdu3hmDjuUFweYW3+D/12N?=
 =?us-ascii?Q?+U3fFvMdRwhIxDAwHxDBoguB0svNIQJLvb4tjc89udPcxd1d1Dbgrv4cWFAv?=
 =?us-ascii?Q?I68d64tzeK4KCmnyxsBYWZG7fF66O3FIMuYM5O+bqthHQ/14GLd5lVF6SyFv?=
 =?us-ascii?Q?2Xh3m92+HXGuGQSoAJmpcRkalwDwoYG98+t5daDIu/Hgr2GoTDNu7EJtowhB?=
 =?us-ascii?Q?csqc94oDC9JIiP9kdIXvuVDGuRj5yqtYuiEMDKcQo+Z97Jcnsv/n07OP5/rp?=
 =?us-ascii?Q?BS4uxdMalVI/AFZPu39rg8DL0gVVKbW2yADAvoIem78ailWUHtguu0oTNVnH?=
 =?us-ascii?Q?jnPJ4EBDwCir7GMetFFnpxZmkOfrJmriKguudJDjM9l4PWluTDL1Qu6VjFdk?=
 =?us-ascii?Q?oA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f06a4854-14f7-49bd-31cd-08dc0d34df16
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB7374.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2024 14:53:11.6757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j589DBvSF+81voPoJNHJQaX9fIkCrz9oryHvrDj5biThBi9ACa+P/a6xfF1FLrshLcczNyMDAPzyNx8SWwNR8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7239

On Thu, Jan 04, 2024 at 06:37:59AM -0800, Jakub Kicinski wrote:
> W=1 builds now warn if module is built without a MODULE_DESCRIPTION().
> Add descriptions to all the DSA tag modules.
> 
> The descriptions are copy/pasted Kconfig names, with s/^Tag/DSA tag/.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---

Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>

