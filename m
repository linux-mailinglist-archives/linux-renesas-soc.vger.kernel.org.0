Return-Path: <linux-renesas-soc+bounces-383-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDD57FCA9D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Nov 2023 00:13:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A6D9A1F20626
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Nov 2023 23:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1BE157323;
	Tue, 28 Nov 2023 23:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="LM74q1ML"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2127.outbound.protection.outlook.com [40.107.113.127])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32E0F183;
	Tue, 28 Nov 2023 15:13:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UcmYaVjEcKaFRcRfjnr0o5CJFRjvVzCVPq7/d/j5hHVekkwzdFXsIArRxNNPgCRtxkHdWZI3MtDD2JX1tJCeU9IWbggso3D0dIOdOc+duQBO7IYfzGx1yizZVZToDNwgcJq7KahdD85TNSNejqvYpQ9T0iILQGCqNWOAShRZcidX7agRL2rhcb+bL4RN8gQE2DYZRhTAobadc63vTzVMRn7jEeO3DeMGK5V6XS+679wTWkrQRqknzORWaNjP/17DS++dLik3jlDOLE7PLNhFOunbwUNdr6fYv5wOEE4BsCoAj0fmq+4BeylL1nJmuImNE2/PC+8YKutlOkrQJpUtDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ja7s1yZwSo/hMyZGovnJj1pKQaKLW5KZ9d49Iw4B5/k=;
 b=mme6bpv/NN0Y6k8IPm1JS/tVDM1JujiG9uRRZV/SUE6ua4zjhOkoda2HdpkYGzMEi6+i5Ju+UbYo3remVnB1rw6XppOwnLD5b3oi4f2YvBHBjo2ODbpnOpWVuFWcsH8NQFS43TUqaKU42DCKXECJcQx680/vQd+Lzq+jBGpp3pDiMyAYEAo+gGuW/JDlI61gC3Wl6CVA1BwZCoARcFwMsMuBEQNr/obBSpyXkbNW5qDwc+QIflgICJkWAIbaV626eLC9PDnXafoEiGd0EbgV4UgqQFgUM9wSYLQrxuKZntiaMeryC+GVHT7k9x3k6v0JsiIDI9WF2d6D1fePPY6i2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ja7s1yZwSo/hMyZGovnJj1pKQaKLW5KZ9d49Iw4B5/k=;
 b=LM74q1MLUC+mO3W3bB/mrfwSrGO3oupM37DoQNG3Oe3+YJeN4t2RBfOe2ZS5merl9t/ogETjkKUuOd0GsxMXodCdCUgdebV/GEy27cW0naGvpnYzmmKmTD0kI/ZV8T4gT/1vZlqsYaPOtkeVdDaGYHkJYmreW3PdP7ih/0OnJ+w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS7PR01MB11821.jpnprd01.prod.outlook.com
 (2603:1096:604:236::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Tue, 28 Nov
 2023 23:13:08 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::5732:673b:846c:ed92]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::5732:673b:846c:ed92%4]) with mapi id 15.20.7046.015; Tue, 28 Nov 2023
 23:13:08 +0000
Message-ID: <87v89l4gl8.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Rob Herring <robh@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Aymeric Aillet <aymeric.aillet@iot.bzh>,
	Yusuke Goda <yusuke.goda.sx@renesas.com>
Subject: Re: [PATCH v2 4/4] drivers: clk: renesas: enable all clocks which is assinged to non Linux system
In-Reply-To: <20231128153413.GA3301324-robh@kernel.org>
References: <87fs0zc14m.wl-kuninori.morimoto.gx@renesas.com>
	<87a5r7c13d.wl-kuninori.morimoto.gx@renesas.com>
	<20231128153413.GA3301324-robh@kernel.org>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 28 Nov 2023 23:13:08 +0000
X-ClientProxiedBy: TYCP286CA0130.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS7PR01MB11821:EE_
X-MS-Office365-Filtering-Correlation-Id: 9140d5a8-4f26-4fd5-9089-08dbf0679560
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6TOBMUqQXR7aOhu9CnSZlhWGRrKMGw9IZRb9ZssX7tIsf0/I+O7dTfZERQd4uDA9GH2BVacWk2Jh+TnJVze2H2dXnM2kJBmQsiXOhoua4ZxE6KDs8W9vi/TF48sxvIIUrvqr3Do6dbHPVs0ePrBYSKASmPDs2/E/I58alYEeyDpaSxm5Gb+Wnbdccvs3YU6pKcWnns8ntlgwy7/uJymGSkZmGVVm7+NY3/DZuqfaq34vqNRw8Oa+kLYY+i2VynFIFTAcALZnvYWELtP8s8JnDzMqQZo55DY8riUUNzcSd4+7LfIhHB4QLpIIfR7WH2FLstKog2+g/LCkcD6jrE1CF7wwrN/nBix1vRRZvV1bI6q5qGEUErqsunj+f3YW3v/udhOzS4UUf2qdHyu43S/SiyZWncRT6Kx8YRIk3gU9nNJmtn6x/uv8L7bKlXJ7L0wW3QYa52RKasXnV3N28AVhtKewbHUNHy7YW7QrtMOjV8UizmmtarEdhB+ARzo7DCT5V304w3S3ERh9DzakOisSVt5ml2UkPfYbf4Z7fBsK0pT4q1LfJ5PEA8uttBdIayVuIUIreWo8QtoRf+Cb07FQg/kxy2rC64prJ1J1NfS7rMePaXOTCMuNtEp6qqk8xCgH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(346002)(376002)(136003)(366004)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(38100700002)(36756003)(41300700001)(38350700005)(107886003)(2906002)(4744005)(83380400001)(5660300002)(26005)(86362001)(2616005)(52116002)(6506007)(8676002)(8936002)(4326008)(6512007)(6486002)(478600001)(66476007)(54906003)(66946007)(66556008)(316002)(6916009);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sBYXbeymMh7Xswxdgf1xxZVjTEJh/0Yt51LGMnUA+orWZtE8alUfFfdEAEEU?=
 =?us-ascii?Q?3GNQrILBIW6sObXY+mhidjxFf/9Pq2G+ecv9HvPUOCm3oQhyGhvcM2Vu4QKq?=
 =?us-ascii?Q?MP+POPkcngAsKvZ08DPPDBH5vfxxYeJTlrqJ94K7BtTPmtvthTni7Uu6gP+5?=
 =?us-ascii?Q?pq/W4A6HnebwlGBZ317rmYELHZzFRn3xxHitxZVfa9y9CRqRJioGfW6+qwDY?=
 =?us-ascii?Q?RzrCEfyIgYbAjjTuNtfxEX31IzIJt4QU37tYGFw+l6Un0EulUhRNc6Y+5cQt?=
 =?us-ascii?Q?kfbYh79gII+6HodKEMK4YYg4mkj+aUhXuNqQHe4cubSMyHfLZdKahaUbJrR6?=
 =?us-ascii?Q?r8ehTEOTO0BfeDAPlygEdiSAsjeNMp5xCAsUl9JCYn7N6NVKwqJnfrja2PPq?=
 =?us-ascii?Q?FamdIdDDA14W4/45vO4T3D3Z7MdhJM3bQgxnKJQP9NK8DORbCV4sjUzeUQmR?=
 =?us-ascii?Q?LJCPtyRy7P/MHyHFMDxrJAVzvnzsCU7vL4RIJEpQvd9vMOcMGzDVn84I9Ggp?=
 =?us-ascii?Q?xIZvq+/TxcsoeiQJ2Lf7itw4/OcZQJTARnUOUvQEnPB97IWEoJY5ul++loW1?=
 =?us-ascii?Q?fQVv38kOLd+0Giy6fm0MVe3w5pVaEdSGJGCA9sAvs+lLzTkJbPT5UpyA0gTv?=
 =?us-ascii?Q?usauFANB10EKoe90mrdJpTHhJOjTjJZtUYaaURY9OxFYZCB07Ku2j9eQz928?=
 =?us-ascii?Q?Wu+RZhdjsykEUCKVqk9SMbGeWIkXMzeMpPgdeZ2fhKPvtxHBW1OI32SznTwm?=
 =?us-ascii?Q?KVXfzA3vSpdYsHvSZcNgkx0mfYNeGX/vdel6/M7ShGmIzyQqOH2X7Fafdn/w?=
 =?us-ascii?Q?jo6Z/68MdNnvmw6NMRlCywO5hlD7Qg6IpWGXx8Jy1EibrzIXOvKGIjTAmBTx?=
 =?us-ascii?Q?iCbmgyyJEZT33bOmWxhbdGfMa+0rNwubDKuZgRq2+VpTm2vIuSOuH9Clb7Ub?=
 =?us-ascii?Q?BAley/xydmERWZJ237Tnq+qFwWr38fbqLf6KQi3EHr28UX13ZUXdIUWFP9K1?=
 =?us-ascii?Q?L2PRPT0C+ag77ZYoDLtHTpaVb9zx/o/S2iq0fOtkFvrcXyhX8tHpptq7+Qoq?=
 =?us-ascii?Q?05i01cHBtWuoasEcUJcLNwR9QkOkDzpXzK1N7RYVDt2/agY0Ed5TQmrIkNAR?=
 =?us-ascii?Q?4ktq+wtNf1wChyfoF5+d6K01AEKOyP3+nt/gCy9/vMIWBOYoUo/MZi7wFBMn?=
 =?us-ascii?Q?wDWPzOxZ0XjHr5LUTiwTR0tZ6b4wMKAAf2icyKIPDxI7QkldcKlDT67Tbgl7?=
 =?us-ascii?Q?KKTUUj725XNMyyv5Q5LZfh9vwqzgw+cxhi0o/YbKmzvzN6UTiLYJcIKaZJWX?=
 =?us-ascii?Q?L1CAvx9JugaX+ahDVT2URDJzW6kWRfVM5HikoSiOtZun3JHPyXcLdmORKefu?=
 =?us-ascii?Q?LgZXJKnkUp8RI4rVLnZPpKkcSzfTIRhARmGIztXTZtyE+ZtjcS9YA8NiP13C?=
 =?us-ascii?Q?sVZjNcgRj38wVJKvVNrtDiwmgGf/6ViWISzRZodoTY37MdehaitJN8XqyAd3?=
 =?us-ascii?Q?WquLATt0R4UwwpdlxJyZlRsz937ZsxutBa7HieCjwXBevJdCyF750xpd26Dw?=
 =?us-ascii?Q?/VtBteBiz7m50w8IE4WP8o165qqewj1mepVizCO73Mr3CqnP60norl7k0YU/?=
 =?us-ascii?Q?PTuNCCa+IMZNManCQHvx848=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9140d5a8-4f26-4fd5-9089-08dbf0679560
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 23:13:08.2041
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Z5ZOwnk1Va3/qc/gf/iwCbgn0V0CjmaGTkBwixUeaUtuefxnHWuaOVBmnQo9fLZoOcf1ZJ9H1pVHJthUmRbpYVhv7JVlFP7WIoT3l67c1Blh9FEA4aP2+8WAWQPM+B/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11821


Hi Rob

Thank you for reviewing the patch.

> > +static int __init cpg_mssr_reserved_init(struct cpg_mssr_priv *priv,
> > +					 const struct cpg_mssr_info *info)
> > +{
> > +	struct device_node *root = of_find_node_by_path("/soc");
> 
> 'root' is '/', so I find this slightly confusing.
(snip)
> > +	 *	scif5: serial@e6f30000 {
> > +	 *		...
> > +	 * =>		clocks = <&cpg CPG_MOD 202>,
> > +	 *			 <&cpg CPG_CORE R8A7795_CLK_S3D1>,
> > +	 *			 <&scif_clk>;
> > +	 *			 ...
> > +	 *		 status = "reserved";
> > +	 *	};
> > +	 */
> > +	for_each_reserved_child_of_node(root, node) {
> 
> Don't you really want to find all reserved nodes in the DT rather than
> just child nodes of a single node?

The all devices which we need to check (and ignore the clock) in this
driver is defined under /soc for now.


Thank you for your help !!

Best regards
---
Kuninori Morimoto

