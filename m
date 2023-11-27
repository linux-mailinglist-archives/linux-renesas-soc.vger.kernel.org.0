Return-Path: <linux-renesas-soc+bounces-301-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B57D07FAEAD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Nov 2023 00:48:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D8D601C20B25
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Nov 2023 23:48:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F133749F7C;
	Mon, 27 Nov 2023 23:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="gx5hzZzj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2122.outbound.protection.outlook.com [40.107.114.122])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A72E81B1;
	Mon, 27 Nov 2023 15:48:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gT7rWhk584uBzuUtcPBBTMNEKzJlQ97/abZtLnLPbLE8XHMsHL6kG5IhD6DtDE6OCbF1qBx5Bfr21fk+OVwEPPEvTbjf/OmrULMOs+jS+kbJtIhoTHYZGXGeGNc0wo0tPanrtyLzb32LJHutgJOi9KS3HM4cqAjgwdpmbNHZ1mF+wKp7vLiKCtvEdAuPL1rZnPrjHMRe5nhnHvh6b3bHuLk0CC1mOH01QL52nV8uh/gg3F9ttTRxsb7a7XhUvkS8mfX7jk2tw9flWCMYGIVSdd0RGES3Jj2Vud/lkUFN2ynqjmEPByMsG/8Due5QaFMWllp/hX1iiJ+dqVXIGnpO8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q2u2L1xgMjL9q7h/0T7y8VmNONv/Bu8MMRVtuX8JlXQ=;
 b=QXsRpYSlpbFRaGNhfzmAUuAaXt/G/WabE5F+pKt/YZ1yyn+0baskz8qJ7FIxm8yGQEMGfc2KusYB/WE+N33nwM1UqUbWXE1pQExoujaXCeZDXmipP1hOtEQuahkvcmQAlyBZ6WdtnOyBWWLs9fWOVhmCh4ZrOra/RKi3tx64ouDNSFk9AM+5aIGO866c7xacr1pOpiRO26jODkapDywE/l2DaLzzJTT7MEaB5dH6ktv65Ci3wGMRcSWjDrB8Q0/xYIW05XDLaeulYyF5eXEKMkseGfUcd+f4mxCPGADu3J/lJD/Pb/0I7N95GuPeqMxX1DNZwTYpIp/H8A4f7ghzlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q2u2L1xgMjL9q7h/0T7y8VmNONv/Bu8MMRVtuX8JlXQ=;
 b=gx5hzZzjOIzEift8huLiwpnZ6C5tpEL6jBuBD8CZYbSZUsoVZJys7gixno3J1Oor23ikJLeMAjMWbJM/Mo4cqhDxd1PBpG4jFWqOF5G0WYMXN4UvDrOwhe6HhVmu1JOZgIuACAUkFs+5B6kwEesMELhjwuS+yrKUJ/eDtszTAVw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB9518.jpnprd01.prod.outlook.com
 (2603:1096:604:1d4::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Mon, 27 Nov
 2023 23:48:05 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::16b3:a84d:faa6:4846]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::16b3:a84d:faa6:4846%6]) with mapi id 15.20.7025.022; Mon, 27 Nov 2023
 23:48:04 +0000
Message-ID: <871qca92s2.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Rob Herring <robh@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Aymeric Aillet <aymeric.aillet@iot.bzh>,
	Yusuke Goda <yusuke.goda.sx@renesas.com>
Subject: Re: [PATCH 4/4] drivers: clk: renesas: enable all clocks which is assinged to non Linux system
In-Reply-To: <31afd614c5eb5e82a860fecfc1c21c39.sboyd@kernel.org>
References: <8734x9tda9.wl-kuninori.morimoto.gx@renesas.com>
	<87wmulrynq.wl-kuninori.morimoto.gx@renesas.com>
	<20231116192324.GB2821275-robh@kernel.org>
	<CAMuHMdU0Hqem8Ooehoo64rrGn8q8+5A8_DjGZd9Tvh=Xej6mdA@mail.gmail.com>
	<31afd614c5eb5e82a860fecfc1c21c39.sboyd@kernel.org>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 27 Nov 2023 23:48:04 +0000
X-ClientProxiedBy: TYCPR01CA0104.jpnprd01.prod.outlook.com
 (2603:1096:405:4::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB9518:EE_
X-MS-Office365-Filtering-Correlation-Id: 168a6785-29d6-446a-f6ad-08dbefa34c93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/dS9CjApu/xY75ZV1KKPFHuU/moFgsY5c8Tg4b1guhuU/rlILTFdQCMR83+X7N+sEv5PX02ex4flykVSP+8lxaFzXfePu/KSM/RtwOZdRc6g4tMBbUJNYdArzfE2MZQRAqS9c5zVZSiTmFzYH04riVee5wdT2sWEwC+SSf3Ea8esWlte/RyXP8HUEghMvYjH5ezG4lb3cS46n71zfMnJoScRAc6tzfNsUxSWCe5VhcpuofFz3dQx5BqVrbhvhjlivGIUAmE90HUtZbCWjvIuMvA5fujX4ukrNjka02P3tD5wSWtqAFwvusfbwGbWHz0twOW4AFv9N142wNkrccfKQfS8zfew3BV/lLNB7v7AU/I+YnjihvAp4in+ic9uD3cOpJW3o42/mplhWUNPoR20upc+k2Uij4ajX/plKMldbD08HM+WU0w/PICTk2pbt/m1iksSttCKuA5xtNSYJKdIjm20SZwKtlgoHEkQ9tuAeErcopLYBj3FQaFxESB4aXyYUSR5fbi/gym/ib0pNHKOETUrBlQNyl97c3y5Yl9l6o0NJ1P0ewsNoHpy5ItBHcN+RzFFInnwQlIlxwRZf/RmdYD1wgAK5aPNN+u2QSGY4SWO00XHz9XEl3V6lpMUeQfd
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(396003)(39860400002)(366004)(346002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(2616005)(26005)(52116002)(478600001)(6506007)(6512007)(107886003)(83380400001)(2906002)(4326008)(5660300002)(41300700001)(316002)(54906003)(66476007)(66556008)(66946007)(6486002)(6916009)(8676002)(8936002)(38100700002)(38350700005)(86362001)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lb8/QbWKa8uEhBzF1WjZ8n/TiblQXLILw9AWuvZ5xfrzaj5pwAn25+ZqANFA?=
 =?us-ascii?Q?qIrrW05xKwHFy38iTZIvVAMb+Jc3gl4/A7aoyRln67UWOvw20k2JweG4tNxR?=
 =?us-ascii?Q?gboCWyOab8D3LqZsVOcwn0s5YGDUkjWe1HNGO+MZ71qDBqYZ0Bx1lYSt/CRL?=
 =?us-ascii?Q?uazsLnswMnbwi0kNosyRzvhxhEipwnlYHY9d9k5/dVLFQXnKDJXmK5QjT/SH?=
 =?us-ascii?Q?1nY4MD100ayUr9MvFhTNRw18j8X45qLluoa9pv/6Jm4nx3SAxwPYE8xZpsMv?=
 =?us-ascii?Q?4S2t90faUrtIezeHRL+EaewSFSodYoT82wNV0LUN/qG3dIJOWmuSq+J9k2OG?=
 =?us-ascii?Q?Iubc+SUpq4Xuzs/SlyrFaCkB9vgDnNWb1m/pUxmBsEGl2rcn1QDn4L6UUGb+?=
 =?us-ascii?Q?VLoJDfmZ5TzDyACKJxuN7M1kGkPbttOjRzicVi2uTZxgIJp8kg+DMQxr484g?=
 =?us-ascii?Q?2noVKi6A9r76ff4fsdqXi3O+cFjqgx8QI7N9FrLJeqsmZcGoAnbeUjHdnt34?=
 =?us-ascii?Q?3Alr42nHxuKp5PE89pV0cVQZ8MRpDpIY6eTVzQeYb2iaEWER/ixRvks9KtSE?=
 =?us-ascii?Q?+jJyiz7GzeP/F4GLI02G9hu3SJpqHWtDNbq7ZLSkqnO2BD73bx2QdKnVNNH3?=
 =?us-ascii?Q?a6vcrsCwkEMpoyx6x5vuxmzmwxdvmjjccoo3Ob6G7JqKToLfNoCPqf+JsFrp?=
 =?us-ascii?Q?aH/Rz//16OLNevtpCe+zCfSa3wTRNoWlsPgEkgRFQ6IRDuR72X35p49X+QlN?=
 =?us-ascii?Q?kllWOCtB5neu3Ycdu1YFPThbA103FMmavNc4rZ2ybf4o+uwnhQqdqeKQ/oBG?=
 =?us-ascii?Q?N+jbEesyy2fuSV5/XmXm8MzKys0xzFpiqUvaS/go4oNpyyWyWPTDMPrbtzYJ?=
 =?us-ascii?Q?8B31yVSMCirbAdA9HdR2UgmKG1A2dO+/KoloDXgNQvZxnH9rkXPqaHoAPBpq?=
 =?us-ascii?Q?53NeqEc7th84hqVDsdqDKq05k9tpFzAlPfYRg6LBHeyQLjd2IA/zwO1OrxbK?=
 =?us-ascii?Q?MtD4ak8wIQvZBVSKvUClhZoQMnuWTHVdvrWqcAPosSmhMztXuQ47stneN4oo?=
 =?us-ascii?Q?iY+NJQDU8QaTQW3oafD4mwK+HwjWkcn35RjL1kmQFIzqGN/IDm+k1Df0bHPY?=
 =?us-ascii?Q?6Z6MlxSmPRrem43eunhFgma5yloK0+CZRaEa+DVh0uKOypfGxVghtlb5QG/N?=
 =?us-ascii?Q?s8nAG0e+Hep3PP5w/oDGmbb+E8spDBGc4RoejatWQHoFHxmL2e1S7n3pkfrL?=
 =?us-ascii?Q?bhsnANMe7IwoATV5mUP+in8J6ILAVWjIleZ2kOZtcEWjhEPuVb8AIG/SqCGe?=
 =?us-ascii?Q?RJtzcjKm1KHn7KzWjw37cFvygH7tE9/i7A2yoc9rjSfv/OVk/6h2Sch/TfTH?=
 =?us-ascii?Q?uzxgk9FEv2v5BVLH61V1IqZbZ/9salswIXT+YkOtgnyE+07Q12639deSu4xi?=
 =?us-ascii?Q?q3FlYq0+ksmXrIVSjCW0GbR6jCgk5Rdh6MD8wjHMKcj3MwNk4h2QjI4KC4bq?=
 =?us-ascii?Q?lPRjDZqLNwPWruZG2S1hgAR1fQ1rGtdWF93OJuw5PITUDAhTqAfysQ6ZYQ/l?=
 =?us-ascii?Q?Sj02mz8zxNkbcqY6I43XELJZ52zbn8mPsD0DMxY4l8yz7BnjUrYUEQS63n4c?=
 =?us-ascii?Q?/MSl6QT7h6/Jr6imxejN+5s=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 168a6785-29d6-446a-f6ad-08dbefa34c93
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 23:48:04.8983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0h+sYPz8PYgOp4psIJcNcROq7d4o5yhcFSCwP7CMzniDU5DRO/mjzlR+EjuI7wJL3OK/7WkgJa0fqhjIdFP5C/NrPdjzy6DKDH96nj2t2Xo1ohRmpzTGOYKQV83QvPmq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9518


Hi Stephen

Thank you for your feedback

> Does the protected-clocks property work? That basically says "don't use
> these clks in the OS". The driver implementation would not register
> those clks and then the framework would be unaware of their existence,
> leading to them never being disabled during late init.
> 
> This approach also looks OK to me, basically programmatically creating
> the protected-clocks list by parsing DT for reserved consumer nodes and
> then figuring out that no consumer exists so we can skip registering the
> clk entirely, or add the flag. I'm not sure we want to implement that
> policy globally, because maybe someone really wants to disable the clk
> still to clean up bootloader state and then let a remoteproc use the clk
> later.
> 
> Do you want to keep those clks registered with the framework? Is there
> any benefit to keeping clks around if linux can't do anything with them?

Actually, this idea (= using "protected-clocks" property style) was our 1st
idea, but I noticed that it is not enough. Because clock driver is possible
to know which module was not used on Linux, but other driver can't, in this
idea. For example, power-domain control driver might want to know about it.

In case of using "protected-clocks" property, we need to have same/similar
settings on each driver, but in case of using "status = reserved", all
driver is possible to know it. It has consistent, and no contradict like
some module was listed as "protected-clocks" on clock / power driver,
but has "status = ok" on its driver, etc.

It seems we have different opinions around here ?

Our other idea was having "unassigned" node instead of
"status = reserved", like below.
clock driver checks "unassigned" node's "devices" property, and
ignore/disable listed device's "clocks".

	unassigned {
		devices = <&scif1>, <&hsusb>;
	};

	scif1: serial@xxxx {
		status = "disabled";
		clocks = <&cpg CPG_MOD 206>,
			 <&cpg CPG_CORE R8A7795_CLK_S3D1>,
			 <&scif_clk>;
		...
	};

	hsusb: usb@xxxx {
		status = "disabled";
		clocks = <&cpg CPG_MOD 704>, <&cpg CPG_MOD 703>;
		...
	};



Thank you for your help !!

Best regards
---
Kuninori Morimoto

