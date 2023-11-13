Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDC6D7EA735
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Nov 2023 01:00:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229611AbjKNAAL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Nov 2023 19:00:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229511AbjKNAAK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Nov 2023 19:00:10 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2090.outbound.protection.outlook.com [40.107.113.90])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1360CD53;
        Mon, 13 Nov 2023 16:00:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mn7YisCWFzb1w73LwGC66xl90k11a1JvFWtH0DcJD8cxoVg1yq4IHg3S9PfJ/y2KbbS6YUvhEVZ5Y81aiCFKyPq/2ea8D+vSGFjm7mKhFwSs9RW9sGLchcwBv0pMUxpaqLqb8vj30Pk2rTTA00DESysmNQoqEcCPZPOrvS9nT8WQEXQ7iDKhlY3izHZoj90xH719fWo6D4jvJf3Wmib7+iNkdW2FEeAxtmIY2ZipQ5cMa+TqNipU/Yp3EyY9IvwPdjhmepwF7QahFqfBt5QypUBznMogmRWqJ6dJHPW2RZM3krakakCOfYh8ipZeacbLkZv6WtuJuwjFlrqOWiajCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7BS9PZ4pkCCZTNRZwCpVfnVTfl/dN0USFJSchAab1sU=;
 b=ipvu+brIokTSSf8ZzxNK36k/o2BDgDnYIxLq4HHoHvzU0Y/QqGSkYJoYlLV4utjRgBEde+gRV6UIr0jvS1+r+H3WfcsUkOpm3Ft6DRahtReni6RwWDyNuqHybpzfNUOfbT7NgZQEDpXQY/w9vTPWUobGrXWr61n/uNKpB0MpMbrxLLLGlurSFigzVQZVMsP3CHFhObN5TVEL2lI6A9MnF1PZW/uTFlqzulC+LqzCVBV7baHnwnt5ozwhW9jJbIWVtOWoc9GYh5s4cfzt5lU0HP4aWFWv/88+ok5dMl8Wj+wYTvWK/Zbn3tWqv5OnKcb+I1e9klJETEoUB7I5QYi53A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7BS9PZ4pkCCZTNRZwCpVfnVTfl/dN0USFJSchAab1sU=;
 b=pVPVMiVs8yp2zf4k4LBRP4sHJO84wllaE0cDo8U5U4ZZkmgfbDN9f+pL/7duftvCp3dre4nSpZJCr6lPIOVRidp7GgFuPRWsKIHe6XV+iokWkz7rxQZaNgLvcyGObDQr+KgII35V3PdLI5ttLz+p0JLseUThZTjSO+fhrGHBMlI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSAPR01MB2178.jpnprd01.prod.outlook.com (2603:1096:603:1a::14)
 by TYCPR01MB9273.jpnprd01.prod.outlook.com (2603:1096:400:198::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Mon, 13 Nov
 2023 23:59:59 +0000
Received: from OSAPR01MB2178.jpnprd01.prod.outlook.com
 ([fe80::173f:d892:3d66:397d]) by OSAPR01MB2178.jpnprd01.prod.outlook.com
 ([fe80::173f:d892:3d66:397d%4]) with mapi id 15.20.6977.029; Mon, 13 Nov 2023
 23:59:59 +0000
Message-ID: <8734x9tda9.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Frank Rowand <frowand.list@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Aymeric Aillet <aymeric.aillet@iot.bzh>,
        Yusuke Goda <yusuke.goda.sx@renesas.com>
Subject: [PATCH 0/4] drivers: clk: renesas: enable all clocks which is assinged to non Linux system
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date:   Mon, 13 Nov 2023 23:59:59 +0000
X-ClientProxiedBy: TYCPR01CA0095.jpnprd01.prod.outlook.com
 (2603:1096:405:3::35) To OSAPR01MB2178.jpnprd01.prod.outlook.com
 (2603:1096:603:1a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSAPR01MB2178:EE_|TYCPR01MB9273:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a233cf2-8311-4d5b-3929-08dbe4a4a4bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uhYsauTcO1Js1vctW++mVkZ6/LmbgliQBAcw0/COhcdjdPfmLvwP6BWIjKjhireulRN2F2K2GvhbCgxThxo2QkYAmETolosuYBMwUxNQJ3mSgn4g3IPeHMAZmBx5hNDnVBN+tR2Whca7nJWtRPcvnb+gfM/LKrNFgoO19PXoGdaZuGxjdpdJV0qEb9jtASrUjF2nt5p/ommfy8rP+4IrDHuMlhpzx1Hx8D0AgM0QuwtUmLfcSyrwET1JwFv3hbpMGzBuMWp0fbqod0b4rkCnc+qvF+wGEut7GG7jkgRXUT47Doujf2xfPqpVebTGJxN0FZJ/FYko5nWwUB9f+M1LzJEUuKXiCMn+9N9p5UtOvfckFZmLq2WcjvNXzx+xbgfJ/FRMSSIAn8J0PnBwmEW3mBdygfAi/JkPEZk9TETE283ZB79ehXA/mxuC/Sea9mCBmPN5kiM3uzNTA6L2InbZScEizUZXz4KhlBlVuIYHjjR5JWnMBjXJSeFP/Yjvu3pQSQukjabPRMJcLl//6TpxcHfXi0dL19lvKXUSt3FGuMZ+ZY5eC/5zpA+lCKmaW/SqwmXIMOFzJEXL5Qfq+RTzSjTTGipoMKtlAfOe4qPKPFk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB2178.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(136003)(366004)(346002)(396003)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(26005)(107886003)(6506007)(52116002)(6512007)(2616005)(83380400001)(4326008)(7416002)(41300700001)(8936002)(5660300002)(2906002)(8676002)(966005)(6486002)(478600001)(316002)(110136005)(66476007)(66556008)(66946007)(54906003)(36756003)(86362001)(38100700002)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MnSqjnSi/bxZV9objyCoPM+rtkVfKh7lplGpL1yjmU2Nk0/Ikf6sl8xsFaf4?=
 =?us-ascii?Q?75Q2LA2HuPjdYDs0O7mn4OibiDMhDMOC1TbHHub28jlbLqTYng9rdZ+9F2Fj?=
 =?us-ascii?Q?lik6dQSSvMQgoV1Ly1hqNKH8+vzi1ljfXjxVdBHWt5jBDOfYjJGKAPLULH1K?=
 =?us-ascii?Q?NMjNGg+FjIf8+S9g/DI7Im+P7FhIP5qdj3Xe+qPmlWFoOnXnrL5KhprPnkxS?=
 =?us-ascii?Q?g1e+JUP6WWgiNR6JfEsGNJkCA7EtKeehoCyEOifXS56eTbwbaKtd9wX35ZGK?=
 =?us-ascii?Q?w44dbx79bGgA3PWtlRPiQlvE08UpkpepsmJNipgVKHyNAYgRDIGhESitYG/3?=
 =?us-ascii?Q?E6s61xxXiXzcQEeO1GmFEEFvcm3m5T9pxYrg1mVvZ/WO5G4cCKVs+Q4RGqxE?=
 =?us-ascii?Q?hwtxBKOebploNjVruGy/8L0ckls/pGI1QqxFNr6gg+Obpp/zBkBh9x/Ys2Sq?=
 =?us-ascii?Q?g6DYo/A6Jk5sJwr9i024DVQ2ew6TcbI4HxdEzd07O6wIJ5L4KG0cmtkZ8DOs?=
 =?us-ascii?Q?8EP9+wWwKzTHELfpvXSicWcoc47IbsizhSzq5IT9CIBtAhLWr/QlmHY4zFAK?=
 =?us-ascii?Q?SN40CMVjbDYis2db2IXeqM4FxdFCH2mshTmYOSlvxpApCC9+LuOf/6Drl+8a?=
 =?us-ascii?Q?lNzWPH4GJhYdaDd3Ah9hH3RuWmVP6BDxgfMlB2kkogenqL80XgApLObpEFrv?=
 =?us-ascii?Q?iQNE82G1gPNUxPMaZOeUXL2WZPSEQup2NIlFMddx9defrHYDWb8/1lTy2zWy?=
 =?us-ascii?Q?opQlBCzdRHMxpwdVe5h5yXWCJ0hWDNod32/FEsOV2zk3eSnIlDrCM1xfjMIE?=
 =?us-ascii?Q?sRgct5bY0tQl2gwxI67YI4iMm2++Cj2HT/HGMP98KhCE1s9w60GuEYcTVj44?=
 =?us-ascii?Q?m8Q7l0WxBtrgKyzD9izN0U2h4dSeBS3DAfbeRsJMJsCyal3VtL87nc0k+lxY?=
 =?us-ascii?Q?gpnfHQo5y4f/XbMEyVs8mj4538gdSlcnn0uS19WO4j9tIA9/RKoN550NvWNS?=
 =?us-ascii?Q?FmPXHpg0JkiWVrQ9DcfQ7dfclOGQnu1OvbBFdlwnMjurgLH1mmxfHnw1h8Fc?=
 =?us-ascii?Q?oTRW2D/ZzuoLiz1kj1YN5EcuB87Wc7T09J3XV4YKmolGhoMLk7iz+p2qQ0xf?=
 =?us-ascii?Q?nNxxIMa9Cfb1rdKDGFXb3h+4GMzKYRb5fzg0KouZvs4IzWjzx7IywcTnBmRV?=
 =?us-ascii?Q?dIwY0q7pV0UAllFp0OeFdGEAjvFX7epDxzyKEx/OP2XtxvkFKCq3YLyN8kKh?=
 =?us-ascii?Q?wrxpq0VBgcQB1L3BgPaTEk//n21bngxkFxM4QOGjThbu2N/23X1GVszjTD6u?=
 =?us-ascii?Q?22AC2CuEsmoHChT36xg+C6uJsJQW4Y5fMzlw6a+moec9HNazjf+ivu/33smK?=
 =?us-ascii?Q?+AkUtIao3X20gk6lRwTXGgLukdQitWlg05zjKB2S9hplQtLq0XoMh3VXzokt?=
 =?us-ascii?Q?xj1+uPAtmPLYVPU7xhLPg6rt4GMwGvyDXNnG+y54hllSqLBXt/tK0OX26XNc?=
 =?us-ascii?Q?xmq+3IdFcvS5Lk0BRuqbqMrc04YzpjNyyJ003qwsT2rKzm8R5/7SysifhvYN?=
 =?us-ascii?Q?SZboYLxKBYys+Yqx7+HJ1d97VzBXk4hjMZeRtGQ1eaJ6Tl43/3HiXVRRQLY1?=
 =?us-ascii?Q?cEtMjOEIAsrba/YtbP4C2xw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a233cf2-8311-4d5b-3929-08dbe4a4a4bb
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB2178.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 23:59:59.3983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f7wiyCz7VRLHq7ZM/4I7NZ8ytrgB3/d4aRmEQNsZ5NgHHrZeLtALmBxYhnI0Mdt2CMttoBj8FrLoxN3QzwR1uMNOur7M0qqBZkcjFOqVbfsHmjnsssrks5wEHVK9JnE+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9273
X-Spam-Status: No, score=0.9 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


Hi Rob, Geert
Cc Aymeric, Goda-san

Some board might use Linux and another OS in the same time. In such
case, current Linux will stop necessary module clock when booting
which is not used on Linux side, but is used on another OS side.

To avoid such situation, this patch-set try to find status = "reserved"
devices, and add CLK_IGNORE_UNUSED flag to its clock.

Table 2.4: Values for status property
https://github.com/devicetree-org/devicetree-specification/releases/download/v0.4/devicetree-specification-v0.4.pdf

"reserved"
	Indicates that the device is operational, but should not be
	used. Typically this is used for devices that are controlled
	by another software component, such as platform firmware.


[1/4] - [3/4] : expand existing function for "reserved"
[4/4]         : adjust to "reserved" device on Renesas CPG

Kuninori Morimoto (4):
  of: add __of_device_is_status() and makes more generic status check
  of: add __of_get_next_status_child() and makes more generic of_get_next
  of: add for_each_reserved_child_of_node()
  drivers: clk: renesas: enable all clocks which is assinged to non Linux system

 drivers/clk/renesas/renesas-cpg-mssr.c | 116 +++++++++++++++++++++++--
 drivers/of/base.c                      | 111 ++++++++++++++++-------
 include/linux/of.h                     |  11 +++
 3 files changed, 197 insertions(+), 41 deletions(-)

-- 
2.25.1

