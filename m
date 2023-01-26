Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90AE767D991
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jan 2023 00:23:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229956AbjAZXXF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Jan 2023 18:23:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232173AbjAZXXE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Jan 2023 18:23:04 -0500
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2114.outbound.protection.outlook.com [40.107.117.114])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36C14367DE
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Jan 2023 15:23:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QwdGGnlgwKLNL+Of1GW+7y0gQ7T6iwiT5RDlOSVwk2KfRLoaJgx8bjlx0NzLk8NV5fzCVljCLRhu6aS1xIHyJK9R9xmOeyna61+LsA4ltIrBBaZm28HmJOhnFQwUQ3qFHxWTf+LmO/1xIpImudubqnvhbdlWkJmIgZ+YtNKQKCy/7XWytMvnQs15FCyJoSi5pRdB7QU/rfL3VdMApokunoNjZManoBTqIs6FnmASeCzQ1326qiEJ4dbNf4Yt0fYZsyaoSwPpU4Eqknf15EzIYQHAcXsxjZWtq2d4n0PsgBvD1d+n7TjVp1HWc3bFkWSTdBXZcCUvRocRylevLRf+pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rcFR50auu1zoBgBh2pA/n5OSTAV23Ntn6URHMag4JJY=;
 b=U3Q21HhWazRx4oroYK+KBfdcF0W58RI4GVTUlK4Er5g7kq4ZH9lm6hlLV+4z10bN/LnpZvBmyEGi8xyA1mfUnaxoVMKwuUYVrZyGQdXkownDC79pf+BNXBHzTvv0JIaT1r+brPO3XbdhtwfPMWruGr8ZpF5LnTuFjX5TQT0PLjdPulfTEQgjY3Km3WvmEIHE3LZORIBSIixE15Ry4M5jlfoJHPkmwlaOiJw65DbdcfPJla8KHDHmGzs33FOMkxICWI8NMybnVD4zkcNw6/djL/sAala8WpOB3sTOHprGj1m4z2Ia9a+gyAEf2Fplw6I0SnAKDUUn8PCsQYHJGEOKjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rcFR50auu1zoBgBh2pA/n5OSTAV23Ntn6URHMag4JJY=;
 b=pejMLRO5gYXQaEWOfIqYfIkW4065IzxLv25DyV9q6oxSYG6isx1MRyBhWzrjrS9dnAKy/Ik38DEbb3GNVQ9k7zxDj4mD8XN4Ot6oW+J6AuCkF3hh+d4CRFgsYfqfLDtLdZS6RNyTbqzKzGCpwqUamPuB8WxPFOx9r/qwQdgyprY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB8776.jpnprd01.prod.outlook.com (2603:1096:400:16f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21; Thu, 26 Jan
 2023 23:23:01 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%4]) with mapi id 15.20.6043.023; Thu, 26 Jan 2023
 23:23:01 +0000
Message-ID: <878rho6fu3.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 0/4] arm64: V4H Sound support
In-Reply-To: <CAMuHMdVHuB3ETAHzo1JwfbHoXPHVEtYmuASC_x-TWVRD21d4fQ@mail.gmail.com>
References: <87y1pqt4vs.wl-kuninori.morimoto.gx@renesas.com>
        <CAMuHMdVHuB3ETAHzo1JwfbHoXPHVEtYmuASC_x-TWVRD21d4fQ@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date:   Thu, 26 Jan 2023 23:23:01 +0000
X-ClientProxiedBy: TY2PR0101CA0026.apcprd01.prod.exchangelabs.com
 (2603:1096:404:8000::12) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB8776:EE_
X-MS-Office365-Filtering-Correlation-Id: ed77ffd9-465d-43f7-041a-08dafff44483
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JjYDzsRTJsGbtdfeUWfvkiILRx9xSTx/tBS8hb+7VJ+xYnrom6emorK5OiNR/NUU0jOfg1lQ5hxciqyCcRWdKkqgB11ud6zOJMWCROiV8Rf1jOJbfv3ryduU0X3Q/aThd2eSAXPgnO5ZEt1USx3GFRfHAmy7sGI376apTk+yQmgimnpV8OdSI6Y6py4Jrcnk1Mm2De/nUiI7LQ4UGqNIbYUmcFP+T1jxtANsAZoYJkOl8LOx9wZP1MO97I3dtJ2AOsSuOZp905wR8m6ZGEhhJyU/KZMhcWZLbsPE6JsvaD6K70wmtvd+VOz6BxchyQTFHlLUvERFPVO0LXeI91ZhT9xqbFIHs11lA5CE1oi3yJ2MseXBsQJkP5LDMiRGCPMIzZZU1AsI3BzLpw5aBByoCi/zjswEl5EusPGphtpGkNK4yS1C0p0wBQTAYDJAKldj/at3jRKRsXtF4PDyjgRjX+cAKfC76vVi2hHD+cPfsnbMEMsS5i3GKUK0KH7pghRSqM0jpm0BC6BXzknQYxj0RvRGnqxXXDJVCLVki5fBJDxmvmZRBbpwug8IuAiHc+DC72TOA1sNXR2ayYyFkknZEC1v9Pip2K40i4VKxSKvyD0dLoRrrkJsYFjosC0N5pcK/0v9BwjSdf9APKjgovfOX306I+idpSDzE+XQEg2wQNLZHDiqaSaW+9zN9hRPtfURq0MkExF7A24YPIUU+7GciQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(39860400002)(376002)(366004)(346002)(451199018)(8676002)(36756003)(38100700002)(38350700002)(186003)(2616005)(6512007)(26005)(86362001)(83380400001)(4744005)(5660300002)(6486002)(6506007)(52116002)(478600001)(316002)(6916009)(4326008)(66476007)(8936002)(66946007)(66556008)(2906002)(41300700001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FnhP9HQJ61mck/PfofxlLa6JVeBniTzIClvY4GKANF7txJmSw3+vxVlEdXjt?=
 =?us-ascii?Q?Y3Mh7oPfOEzXoyoyV3NFzucUqVGp6mB/Q+TzWNVbYcEFgX2I39uUvJO/kRvZ?=
 =?us-ascii?Q?yN3ij5ai1HntwrYTvi+Ahx5vbLGeAbarC3hu1aXtsOewNmQ0bLud1207qpbQ?=
 =?us-ascii?Q?8x2WubY9zfadrFJXP7BcB+5wHItcLeZ4YbvkhRDmErnrkFnZe84puqljgghE?=
 =?us-ascii?Q?8kBm+c6Zr3AIFiVb/uDmKmhWzAPbGPhxRuJuFjabkJAHPjMcemjV2v4CRoga?=
 =?us-ascii?Q?3AalXp7xAa73A+qnWf/KotIqvFKZFovCfDGXZ6fXsQUdsEcVHq3nmiVChn6S?=
 =?us-ascii?Q?NBdHJKKQTjDBlnCpG9xQMe5iRIHsG+RWasocEZOUt4MJM0ZWRVRrFj/5pLdA?=
 =?us-ascii?Q?+4hMh1pdRnNhKSipjdlrthjX61h6zTTLggAei/EgvpNCDkGGVqM8RdhYQzTy?=
 =?us-ascii?Q?O5zkAI9o5EeHDmTpskWX5aoS1uTxjKN/GUoMrBNRrMDm3QHyp0BLLGoeErSW?=
 =?us-ascii?Q?uGidTaH1f9u2gCh/0YKIFpx+xH94hFf5/vCtq4ulZkf6bXJEs7ckZc4OWHgE?=
 =?us-ascii?Q?XK0lNo0/wQU80y+txFx/V6+KTLJ/PLErZwg7+E4xygxwhRnpj+o9dm9Hx+lQ?=
 =?us-ascii?Q?VjqTF/3kjMRBBtEBksv29GixDmuu9BhRvjobbMrkWG8JVXmegCaus0JSmCZ9?=
 =?us-ascii?Q?mc5IYKnO/twgruCXrwf3CX4lg3i7Unkdw5I7kTnyTzKH7LJL8qijgFjhwfGN?=
 =?us-ascii?Q?2bdRacSEylkvYqsbsn6QJTS3Ar+38mMdwMRyFbKb/n+QwFXzQGWgn6+PGrhK?=
 =?us-ascii?Q?QksqaHGbW8fMRgScKLoUeF2Eg6ZGeru/9u1+pJneO547gOau1IGnDdpcXMBb?=
 =?us-ascii?Q?GqzTIgpZYRLINj5oWrr1Ei7wAD5cWeYdAO0wZnLj/TpomisN/LBMvicrKMqG?=
 =?us-ascii?Q?66GTW4NWreX5DkvoiNCnDRLVX+F66AsIMwUZ12Ap+4Ryd+PklREuMfAwXsMO?=
 =?us-ascii?Q?Rxe7TC5yZ1KAOmZoMcKJyiquFd/XWrTTVv16oY2A+IElMX5uQ5BRyikqqlMT?=
 =?us-ascii?Q?3sF5fz662hxfB592DbWcgGmmOAvLqfIRtLpRj6GfxFOY2vZSCKtCqd6yz2Yl?=
 =?us-ascii?Q?to45NwZp3wmNjwhpQXo7DGKlelgMg2mrWhZ+85Lr02+YMyRZA7D9jaFuTVgJ?=
 =?us-ascii?Q?C/PjT4YQdYq6k9NtkWtEBRC3ZfBnlrQpcK/iKjP4fNKwRB1YsMfofTuD0W/A?=
 =?us-ascii?Q?xvf0WB9V5zGryYM6ukpN2SiOz9VHSeHge9CYzFZ1WtqUq0SOjN5TY9Tge+cA?=
 =?us-ascii?Q?QoFTCoLGD7y+ChoniCCphIcyRphIJ/Plo0FCvFbVb55NURONIrAKZMwIK3IG?=
 =?us-ascii?Q?Gp3JsRGlzq2IPd+hDcPHwRWpsJDTqcSK8LyqfBwhMnI58AuGxYziKH0Ma2KU?=
 =?us-ascii?Q?dvqG0cm0wOADvQXpzIaWHEp3Zz3m/q2E5pjrr1Mt0dtzuSwhuQYdKq67yjjP?=
 =?us-ascii?Q?6B72VgdRo8XJciPKNY4IDGXo3qG1fImNjrYIdxYTvfLNHcHJCbtbOlXpQo3b?=
 =?us-ascii?Q?JBpFR2KCQzlxs93SHqwc3BtnCSNWk5soRr1k55S25nYLZfdOya+SoDpkjBxb?=
 =?us-ascii?Q?Lr6cxTvcNegk3C7MKZkAMMY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed77ffd9-465d-43f7-041a-08dafff44483
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 23:23:01.4292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +JaQw6OR71uHueqgie/1O/wDKifSnHmoOAAZ7KuHfii5ceqMTZznD4KxT/9JsyEEDCFtSSsjHV3VXCw7fyJYJ0kag8N4wA6h4H8L2b+bSTDQRtd/rkuIrU6s/HVg6fYC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8776
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


Hi Geert

> > Sound test on V4H needs Custom White Hawk and extra Sound board.
> 
> Do you have more details?
> I assume you can get digital sound from CN-40?

Yes, and need magical connection to extra Sound board.

> > Sound Driver Gen4 part is not yet tested, but SoC parts are OK,
> > and these are for it.
> 
> What do you mean by "Sound Driver Gen4 part"?

Current Sound driver doesn't support Gen4 yet.
We need patch for it. It is not included in this patch-set.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
