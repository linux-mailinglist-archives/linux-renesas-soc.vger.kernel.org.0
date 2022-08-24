Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 116AD59F1E3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Aug 2022 05:13:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231280AbiHXDNV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 23 Aug 2022 23:13:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234294AbiHXDNI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Aug 2022 23:13:08 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2103.outbound.protection.outlook.com [40.107.113.103])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC0F87E031
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Aug 2022 20:13:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ke1MsktP2aIyNr9hdklfLZfcM5WLiAY3frrMUeqpVYkiQORDGzEvV5m90mK4jzXB36jRc1PXG64iai0bc4VVDdK+YMMCypxEd50v59EgyIwgr9Jk5JUtusG6wzyZKRHG09kTBGQcqtCvEmvgceIYXNOf4XgUNzdsuTqzKtOgxj1AlGiwGS4PP8NhMuYM1oUFClueymQQ3WrRnfaKRvLev06JxUUEn+Bm15hgnSGWekKeUsxSyXOGQJDYEcXUyAZajUbsWr7LfLfdFsXTq87+J6sBdUTxwSSn/OFEhsssCcdWppr3zfdUxqBRnE888iWuP245tqya7LaUKAYgwFwj0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U50LaFHLNSziNLMhpg3SUjDEAfIcVLJYfm4MDCKvPUQ=;
 b=iuEHLrK1bO2ydp/SgJgCPFMMfaxUjX1dz26YN3I9PipBHHzbGJuq+9e/c1E4BkynHBYpixYMucav4pYXDoor4p9hNAqser/Die0yb7h53jd9wZd0maN92GUuxsYhFV3LT09/48y4eufLWGyuU/Ln6HORn3d5m00VR9gU57HEaFthz5Z4Ec0ZjEZ6DDHlJeVyAUwhIsvbbYzF/6QSF3l6UUzByavl85vh4Mj/h6vLWgsE1U+6smYaleAKoXofLv5HCLvknzvU8Ys75XDvJC/Y+iST2EyeYqp+9X9NG78XZcGqUVkItjKBHik5RqErhmVABKD6Fxtus9s8PUeXsVnrIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U50LaFHLNSziNLMhpg3SUjDEAfIcVLJYfm4MDCKvPUQ=;
 b=HVAWU49wFe2eBFPhmI44M7LngOjSEJpU8ReLjXCKARc+N1lmROrVP7vYd4JH5BfcflLdkY0wzz0v96z8O+eTV+lmNsooqz9l3IPvv2JX5imtXQQaarvp5AeKV8K8T/EqIt6WEwJVwwEb3T1Dxf2zxQPI2bCxWywDjjmqHpx+aWc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYAPR01MB2029.jpnprd01.prod.outlook.com (2603:1096:404:6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.19; Wed, 24 Aug
 2022 03:13:04 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::bdab:be26:6e36:88c6]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::bdab:be26:6e36:88c6%3]) with mapi id 15.20.5566.015; Wed, 24 Aug 2022
 03:13:04 +0000
Message-ID: <87sflmuyf4.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Cc:     Saravana Kannan <saravanak@google.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Laurent <laurent.pinchart@ideasonboard.com>,
        "Geert Uytterhoeven" <geert+renesas@glider.be>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Subject: fw_devlink.strict=1 breaks sound card probe ?
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date:   Wed, 24 Aug 2022 03:13:04 +0000
X-ClientProxiedBy: TYCP286CA0122.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::8) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 377441f8-3d3a-4755-9626-08da857e8f55
X-MS-TrafficTypeDiagnostic: TYAPR01MB2029:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QVPWycNWjl+DPDsHW1osXWhV6bFd1nhP8MSdMvO/E3HdjisM0Tv8ghVtT/hLAu0QeOT9zMP7iOfQ1xZjmnMZFB9bUm1XH9knV7bruh81EhpX6Y8l0y5itbyGHweDzx+p+fLaJhWUane1Fc6iyLkhNZjj8tqIyu61vXoekcmw1K2e7y6IfKzdhQMmkHpkQiFNmwMwWXaeundCp1md0iORDrD3JiFN7TNTZ6M4eeaPL+azuxNKfEiBhY9dpcORPdYfJ8wDwRQ9dJke/TIgpbDGWrngNpfY3oq6qTpWbqNvcxnXeSN2zCesQi4bTQ1jsVcamRAl4ylMOZeZoHOh8wPIg4xDgxHuXym0aMk4HssLqFeCp4Ikd6klpqkNGs5qv/GD3CpBPvTy8xTFhn3ezWUmXpQnoWO8f6NSFQjXbmqK2Ifm/pKgKJ2EpMVkKzDy50XTO/wpkpIuxWjPfV4BPynGvCF47hHDR6VwQJc/O+kK/xN3Z0rJe8jihUtRhUSqV6rgUhae42xMM+6UPw4BZz4OltXVgT6CJGiVgSSIlVfax3kdhYcENzfCPPt3kaKRZo9PoXf8LpbkmzRzB83tqHju8NJu9lR9xGCjGvb/vD+uGhDpOs+e2o+16+iemVfy/yKGZvXp+CNeQ6dnEwE2IKnMh0dV7nn17Ameu6COt7ikYJNWQrY81Y0mnBKG4ATKpUAw4ba4HFYziH0VzgI2DblUus9nL2sVhdxd0OIumqI5BqK6yQWZUpd9GP3MUn6gmSKXNmRepKFUzEoEMWM5BEZ51Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(366004)(39860400002)(396003)(346002)(376002)(36756003)(2906002)(4744005)(66556008)(66946007)(66476007)(6506007)(26005)(52116002)(6916009)(6486002)(478600001)(6512007)(54906003)(41300700001)(316002)(86362001)(38350700002)(38100700002)(83380400001)(186003)(8936002)(5660300002)(4326008)(8676002)(2616005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rh/DE2ZPz3EJxb7sb6tB4Yzsj9TQOJHSW8tyN+RZnZUrALW8PyPc/VA8R5YW?=
 =?us-ascii?Q?FO5HRXTf/dzYc4RFUx+QldP6lB3W6U9j4EVYzBFS/xxleq30WiY7t8I5Yi/U?=
 =?us-ascii?Q?tfGxautUAUAI+6/t9gojlaTYuB43glPXc6CZ6oElNL9ziEcw2iiohjUTAbat?=
 =?us-ascii?Q?2jgTKBIW5CBjCbTiOVw/xRQW3tEnPigQSfFJynSHsIDnW1vYBBHD6Pw7ofa6?=
 =?us-ascii?Q?jE+uBP7i/1FG8s3+AXztp8COoCXKH7kdKxnxztQjP3rdTG408Rxi6LffVYKR?=
 =?us-ascii?Q?FkmMsoPeULZLRUo04tBhImqsQjTaurcc+be9iH0ttDPESWzRq2ISWVaWIpt5?=
 =?us-ascii?Q?kiJ1YBnxU6Y6kXfu3Y9jrHoa9IIKTfwVUlIn9elX3ApEYDZkc7MLlQEvqz7+?=
 =?us-ascii?Q?me8LL2R0vy3tn1d3+wSRi7l9gAghfHVBSC7VZU1f0ND/WsSfjvoRm3fN+d2T?=
 =?us-ascii?Q?vjaiR5Jo47qF5LYwpliZ/qTdI37KP+SdSn1Vhbnkr/EkuG3rO/FlVANblcoE?=
 =?us-ascii?Q?uA3yufevytMAryR5jLSeXmEQm6TZCSmBBLuIs27czzHBv8eiwKmRGUCr3vEs?=
 =?us-ascii?Q?pxQPQy9tkiO4cd/DQcgv6DGMiu9pacLSITN7NrGjePb8NANzATqpWcugNxjQ?=
 =?us-ascii?Q?HRNVCFRwP00wjptSwzOd4gvMTIUf4bK2mMyIloBzFQ5Qqm4DkTR7siv0pRpE?=
 =?us-ascii?Q?IwHsgTD1WawRP1ydXfFDVAVaLzwJKNOnvvY7CZdsy5lYw5Tp+RPKytWDLJDo?=
 =?us-ascii?Q?oTp6el0Yb8/eHCWo+rjvPCzdrQvQa5RYSc72lDCtn8Ll7S+Nd0prLBqfZaav?=
 =?us-ascii?Q?6nYvniCmAuMGOQpUJk+Ml4nkdArrAwl1Rf2IpVcMwCxbWvihsleGupmu8xrE?=
 =?us-ascii?Q?PNFDkEoMvFhf+ld5j2zaZGonFwLao5ChUQ+cXbU/Z/z2p25bDgp1dPA90Qy5?=
 =?us-ascii?Q?nHHkg8efumfLO+JRXLDUrJfzeA8Q8eBDLZ8jZxM/SVV2aVDKg/YcEXs4/yYR?=
 =?us-ascii?Q?ycBOck6BcQKy08xBnFU5udJzS55C9eHkLbb8dBdKfd5efywtF3VGdjP9msN9?=
 =?us-ascii?Q?agCnogjTdfJawzum/1kYA0ls+n/w1F/pfz0+lLZqj8i/sNq1ob+n0sREpuJG?=
 =?us-ascii?Q?VvzC3kLge7GvZkkEBU4X+3ZEwsCraILl/5vSvW19CasJeNcUzJUVKjzfPDB0?=
 =?us-ascii?Q?jAcXiHOACYHsHwL5AZgbr6nPIF3B2WQjIn899aFNKAk8Yhg/CnOaiaMT45lA?=
 =?us-ascii?Q?RaaNGklasng9l10AUbEE6G8E5dkaqOkN4yqV3ydEW+MCE0IJAHyyIu9h6z+r?=
 =?us-ascii?Q?6prJseodTspG2dnuiEi+u2KtAiGi6tHeOnvIDFGbDGZ7OZYs6FQLumCzHkaK?=
 =?us-ascii?Q?PZA4c7iOV+AVdA8tk/m+2ZJ5WGFtj0l4o/BEP7U9mzOLBGCDA1tsj1r7UAH2?=
 =?us-ascii?Q?zn8QdSB8QOkkuXlhZ0nTrDMBu/owiuMIHj6u29N6cyt0OWwkpfyp+A4dR63Q?=
 =?us-ascii?Q?x9WEttwTHQrGzYFE0YAmSVi/OMK4QwXz2BGmQuCVDemRv48fqhbt6IXczUnQ?=
 =?us-ascii?Q?y41lgZB/QwRCAI/ElgCbjQ/InFabWjBMQuyXgXlf1SOi9mhq0eTy3vUWCskh?=
 =?us-ascii?Q?KEAgwPpbI17xbfVi+Ax9rTE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 377441f8-3d3a-4755-9626-08da857e8f55
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2022 03:13:04.6439
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1+9V7y8iJc5M9X2r4+/V80ydDh1GNdznuNEI21JiSwrMANBVlaho3k8W1UhwtYm5MUVUknDIR+WX5m6dU3wJJo9bA86XfKA46pvzt9oS6bCJ21cMtP9SWGLAhDpK2NSC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2029
X-Spam-Status: No, score=0.9 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


Hi Renesas-ML
Cc Saravana, Greg, Laurent, Geert

I'm now testing v6.0.0-rc2 kernel on ULCB-KF board, and I noticed
it doesn't probe sound card.
I git-bisected and noticed that this patch breaks sound probe.

	commit 71066545b48e4259f89481199a0bbc7c35457738
	("driver core: Set fw_devlink.strict=1 by default")

I could re-probe sound card if I reverted it.
(My .config is using Y for all drivers)

I'm not well understanding about this patch,
but it seems it is related to deferred probe.

My sound card needs many drivers to probe.

	HDMI
	Sound CPU
	Sound Codec x 2 (depends on I2C)
	Sound Card

To probe "Sound Card", it needs other necessary drivers.
But it seems some necessary drivers are not probed by above patch.
In my quick check, "HDMI" and 1 of "Sound Codec" drivers are not probed.

How can I solve this issue, or where I can check ?

Thank you for your help !!

Best regards
---
Kuninori Morimoto
