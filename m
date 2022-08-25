Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 495375A0586
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Aug 2022 03:11:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229669AbiHYBLp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Aug 2022 21:11:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229707AbiHYBLn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Aug 2022 21:11:43 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2098.outbound.protection.outlook.com [40.107.113.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A3905721C
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Aug 2022 18:11:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cXUpgBVRc54KbUoxEQMDa3LelrGfChSm/FHShSPekonFN2gYYpSoMeYDWqiCFPr+BFo6pTHPi6asy2ZNKkL4GI+g419U5YJci/w85zom3nBOXnwUlLu6V18IxFfHW1fJ/GklzkE0qdJtxM7SKCcQnxMnEAb3jXzRdFqdRt21Cy4Mzv86rcOXsJUtGdCv/Ytz16cPRqOKkQ6NSqr6mnNoaWgroFONTfd8bqmB0NqxUOGQ9XswWMM5B0ohPpQCAC0l9cjzp1+RI+SXeL7HUm70avxfbsxnbXAuq7jHD2W3gcB+ZJwJKFrZiIFQZX7Zy7SxGMWH46/TY98fGJ+hAvT3uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WA7/e1R/FURuR0Y5EANCb3ghdQw/+NSM/Gr0xUtK5xk=;
 b=lop4uOeXFRbjmwfzorOnW01fppiNsxvJNRw/chh8FQrZrUwDoBmLI8CZHnuDxdYrqWOltxT24gCKQNUXWVirxwO/YF0Jd7Xq14Xmbe9Ut9uemvPU2ntbI2LhJLtxmZz6u9w/La0tgN1cUiD7nBcyyq5ei2Io/v5BtD6gNwM69Q7WqHIQ3CrmhIlcuaj/VeWspSWhq6HfWs9t3dziZugTfgvAJdWFqT3FDpUOuPvayAPRqxWi88RGRTbLt/36jm1z/bZ+iHJPZ9wDIJOAXVrK8iQyxBcZ4Y/PTpxFkNhHqyvKR8jtqTjypU/KvngPkeXBPi4KW69qdDRpsq/J3BBU4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WA7/e1R/FURuR0Y5EANCb3ghdQw/+NSM/Gr0xUtK5xk=;
 b=Ej0Wx4CgYods9L4nWzxLUZXg9d2rtgLb3FM+D1sijIIOa0T2WHQr5KRdJ3/023DTq6ygQrtB3jlhy8oaJCrpjxwru51pEYli9QDMeG+/J3uFPm7EGYIXh2LKm/K6X19Hb7WXXPAcpqoJoIKaKs8b/NgpjBpEZUuOEV4RcXdS4eM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSAPR01MB4563.jpnprd01.prod.outlook.com (2603:1096:604:6a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Thu, 25 Aug
 2022 01:11:38 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::bdab:be26:6e36:88c6]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::bdab:be26:6e36:88c6%3]) with mapi id 15.20.5566.015; Thu, 25 Aug 2022
 01:11:38 +0000
Message-ID: <874jy12kl7.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Saravana Kannan <saravanak@google.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: fw_devlink.strict=1 breaks sound card probe ?
In-Reply-To: <CAGETcx-4+RkgXZjK6yDMr97Q2iUDJxosqp9s2EyhFW7+WCcFrw@mail.gmail.com>
References: <87sflmuyf4.wl-kuninori.morimoto.gx@renesas.com>
        <YwXxT0Gr1KQQb71F@pendragon.ideasonboard.com>
        <CAGETcx-4+RkgXZjK6yDMr97Q2iUDJxosqp9s2EyhFW7+WCcFrw@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date:   Thu, 25 Aug 2022 01:11:38 +0000
X-ClientProxiedBy: TYBP286CA0019.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:ce::31) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d811b10e-fd54-4b99-fd5d-08da8636c31f
X-MS-TrafficTypeDiagnostic: OSAPR01MB4563:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3S6gEFSzrO2/v+Y+N1daYDqoFKXM87+NtW6kbbQBeN/varlvjPpuGG2ZWaY6pZWJI7OjQrOG6Z59CLeMM6RtnewSMUQ2ZXNKUMuOnr+ce8WeJpISA5NPW+jgs3PcoKoKR9HgYpIbNUUgMJN1IIqyUspVtIrNt1gPYsnMNZD98k3rAKK2qPyjHKKAeel+aUOugSM4167dlzqRpCxslfJIWc3WP9ft73CiYEE0tv/5toafsOoisylS959HWyBvs//1noPUcKHMSVYWyBY8Q7aIy816m5sQUvYXlyso6pNSNqPC6mVARqEudC3x3tCvobaEaUCCzXWoTaFtLb5D5WFHxfnFvyYMu39JeCFIKvSyU8jRLVyi9v1UDY6g4huFa0yqrX9Ch+VrtRPB2ErsxD+8vs/4E0gWc6qO240SEofAQDhQPS/iWj+5Wk/o1o4bap3u9idNULV79vn6u56x62WbpPq7AyxqyHlkdPVvR0hf0RQu5jAeLDPggACw9mavucJnP7b/vQfagK5ZaamXeIi+9XInQLrQ9H/oVOWtGB34kG9qrDxMs/89l2v+VK3qJ7Pi+VZCufGDbBqz1IP8vXp4eCfhqH4KAhPYXWuQcAWzzq+zRIHvuJ5VcYhYtWJPhz9fbTUwY+/6HpjYllmOlEu2B45VyP+D4daqIjMWihnLvQOHBmLrPpLfayc5Yt/BbLNoAWVsoLJv1qbRknFrnjkJEnPIOQLtW51ghrjJFUZbmI8Ey6Y7lp2lp3GHBmNpeHosgn2NAglngbGHDOdZIv3E3w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(396003)(136003)(346002)(39860400002)(376002)(38350700002)(38100700002)(6512007)(6506007)(52116002)(83380400001)(2616005)(6486002)(186003)(478600001)(36756003)(8936002)(41300700001)(2906002)(5660300002)(4326008)(8676002)(66476007)(66946007)(66556008)(86362001)(26005)(316002)(6916009)(54906003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IMhoxCU7aCV75HDLBLPBvdwdKhCCtd5Fh+gEkbXKC+q94VGseBCo4j/40XvZ?=
 =?us-ascii?Q?iqGMJ/HktoaNftzknI2+VfZmNdSHCykzoBnpAD65aTiL4D6EzsJLSt7zhVha?=
 =?us-ascii?Q?KUWGT6WIM17suLKFC0eb0wl/6eFX2GocqM9XeJKdPT9CIetpFgk5KmTjubbb?=
 =?us-ascii?Q?j3wnkam480CRLwW/PY6/NJbiFv3rrP7v9skcl7jXgXtw8BNpJdY0AwjDJuC4?=
 =?us-ascii?Q?NVxQpQex/b8Sc4I9DDZfgoyUSGC++4kwXj7IFGrOo4pvXXM7KD1xrdrYDHNR?=
 =?us-ascii?Q?jv/FA4o4RNbAEQFvixNv1h51tkChw/5yaYfihBwJMkEOLP/9/XoHSzNvk/F5?=
 =?us-ascii?Q?STHAwloi9uYXTcPJGnKxLP8Sdy64EqWBVUU2mQgkVKVPdOtdyEA/CdA9rkOQ?=
 =?us-ascii?Q?/ZoJ06o22I/ZDsMNwekqk9YxiyWjOJpwWB7Oahi8JOA0P/89O+XtabkSq6W2?=
 =?us-ascii?Q?dHn8iqurYrqdesUXHxfD7vx/vxTRso/9WAgPSK76fTvrW2q6g4l/SJbKeLC1?=
 =?us-ascii?Q?w9zWHk5Map+YfAA7DXEDRJhJr7+nU/xcdU8F0VtVXIVIANUrLH1qN7GTBqWY?=
 =?us-ascii?Q?DPW+qOIeVjRLEwyYOH3fvSoTFXxSOyUCfnjSBdCBl0f+IcV+tY10mh4hfe+A?=
 =?us-ascii?Q?tM/BkwRte0ZolD+LYeGtqvAJ7ufIQc6wLdbDfbmQBICS/gpTGNtky5OtevdK?=
 =?us-ascii?Q?1olkbtffKwA+QKjQNSG8VQmEW+MQi89r2EPKkBbF/0Dr2RxIjzWSMX6TTN72?=
 =?us-ascii?Q?QkwXz7DfK0ZfIneAsl65zd0im+B2OLEEC8URdaZHcPGMvEanoT4ND/A9A32X?=
 =?us-ascii?Q?0YdsVhBBJfzIULyK3Y4z4ojqpImbpEsaVjaWumzOOixWs2CvLqQX15jucURn?=
 =?us-ascii?Q?CV5r/vH5MS8fO6GRI4rvcbeLtNby2NkS17AzAhcCJWkCjsl4Cy+8+AqZ3Elr?=
 =?us-ascii?Q?ZGE7Ho36pL56WqKyPFWIf2h6JV3KtdR89CjHLh7YclDnNzNg05IQclS560Ah?=
 =?us-ascii?Q?Bbx6+r48QjpI/F2KX2aif0nSzoZMhtnBkO45iFHXYkUipowjibdHSv/M8JV3?=
 =?us-ascii?Q?RJ9OIGWF2JPPjspvRJOJUFlrTV4IkjgJChjdii0U+EDY1CMdUN1uadG+NyJl?=
 =?us-ascii?Q?l44V+pYiqWwSPifkeSZy8LG7ahOVUM349urW3OfwOzo2AlZoym52vB7K/9xq?=
 =?us-ascii?Q?euX/tED6kNAP+AQQ31lt/K8Vv6Wu6r9eQ+JYgHTPW2HBSkJjUwiGshX/sIHe?=
 =?us-ascii?Q?mxDJa0gwNZcm3neFNAOrhaua5LwTWysYIoWN09rU9skWzZKXWgNKd3NTvjrM?=
 =?us-ascii?Q?Gb5Akb47pmHxw04GA49KAUWmvzGohDf5NKcMHo+q6v/S9Y2xtZ/LAyQsu4ZZ?=
 =?us-ascii?Q?VAkbS18KzXX2SRkBL6CJskVvM9ux9m4MRmk6Ax5fGx6iXweDWrc27Nw3hHTO?=
 =?us-ascii?Q?u0LHXldi59tIqzrlulb9bSlJPGRzZPovgYNpRYKIhnwSciS733JZCuU+t9N3?=
 =?us-ascii?Q?4ketAUNjC1hJxY5ILdVhoXmh+/4rQlJthK2oe25ZBcdUfPqQ4n9w7b9rthZd?=
 =?us-ascii?Q?YxOO7CQ3sjd7rYHnUoD3pGOtxOunwYOl2j9Nh/BPzyZUdqQJ5clW4eGXPtZG?=
 =?us-ascii?Q?pk/TgpFGNitKHkB19/259l8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d811b10e-fd54-4b99-fd5d-08da8636c31f
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2022 01:11:38.8230
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sj1cgGzxMP3DgBVYNbdSqvQL7fDQtn846dIsxC3dWzFM3Cx6F6MjELyycBvaVKkxKgvz92Sh92V3ZQLuouQZJusRHDZzFFj5TXPxaqiKemMn+XQADvLIogVLJm4+EXiC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB4563
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


Hi Laurent, Saravana

Thank you for your help !!

> > > To probe "Sound Card", it needs other necessary drivers.
> > > But it seems some necessary drivers are not probed by above patch.
> > > In my quick check, "HDMI" and 1 of "Sound Codec" drivers are not probed.
(snip)
> > Saravana is more familiar with devlink than I am, so he may be able to
> > diagnose that without further information, but otherwise it would be
> > helpful if you could provide some logs. Enabling the debug messages in
> > drivers/base/dd.c can provide some insight. The contents of the debugfs
> > devices_deferred file can also be useful, as well as the
> > consumer/supplier links in sysfs for all the devices involved with the
> > sound card.

Thanks !

This devices_deferred file (which I didn't know) helped my issue.
It was my fault. My .config had been missing necessary driver
(= CONFIG_REGULATOR_FIXED_VOLTAGE).

... but... why it had been working without it before... ?

Thank you for your help !!

Best regards
---
Kuninori Morimoto
