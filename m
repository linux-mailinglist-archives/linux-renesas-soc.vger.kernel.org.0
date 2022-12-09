Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8631E6486FD
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Dec 2022 17:49:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229640AbiLIQtd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 9 Dec 2022 11:49:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229912AbiLIQtV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Dec 2022 11:49:21 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2094.outbound.protection.outlook.com [40.107.114.94])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36AEE941B2;
        Fri,  9 Dec 2022 08:49:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZWOTE/sbRIwFwID3ndoYa6WLGee0II5dWcivA2zaCjzISRMpyHMFVlxD2DtOXKgSldZkBkVqGINZ4OSjIs6GO1L5iWgqRyPjsbng9KZPgXtYluKhUS8uakqf3rKgtZBiDa2qfocXgRE280gzITsaChuxvLgg6Tw+Fn6qpZwT9nki5LbIcHkXyOpbO/ronD2lh3kBLMvBXP11lzLrVdQK0A6yYKAR0bkNHcpStcdVyiRwBhCxBmPaTfJoxE53zsE/6Fn2mU1aqdWU3eYwfaO1W8DvgHJR687hwTH+nTI37XLB3gOQ3SJfw+z5zR0onkumogK2YPC3jNnl1KzutUmuhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s0j2KYqBL4/V4LWcv306+6DsG2lGl0PAAhlh717nkxA=;
 b=UCp+4n/eXQrO0bB1M0ogVQEPHqW+uKUCeD2GH83FC7d9XNZECXZqJrPWWIy8ETk/XB05OOW+llZ5oMD6oIuPCvhtfa4hZNC3Tbgkv004F2/gCv79fLyssT30BddkD1SKz+0m8eZwrUB8yaOx5rX2VwjvgWSNbTiYMTc9pRWnsce7CGaupiypERlzZWWuQ6d2B5bkVx3r6GoUCPU/GJubQx/sFTTf+tS3IeoLY0Xj+KWafTFnPDrA9WSIfpnADxUYG7v8ufqaXt2qzI8gTi2PFxFKar1sjl23WwsK7toi3Lsf3PqIW6fYee4XBhhZDAsWSyJD+YggmLh1GtIu881LoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s0j2KYqBL4/V4LWcv306+6DsG2lGl0PAAhlh717nkxA=;
 b=vgCd9zWLPr6YojTLvJ/5anqQpXxuvC/+qug8ei+HemCq7GyH4Ewo0lx5ejcIvf5tqFw3pxr5f1iYUUckqYY0V62bIZDln+YLobzuUUrqE7kX/Pw9mUzbFBUqylRAJMRG4L+6VubDGzbiVcCoau4BVjNW2+uLphAidrQV152kNNw=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB8015.jpnprd01.prod.outlook.com (2603:1096:400:11c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Fri, 9 Dec
 2022 16:49:17 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2cfb:38d2:d52e:c8a3]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2cfb:38d2:d52e:c8a3%5]) with mapi id 15.20.5880.019; Fri, 9 Dec 2022
 16:49:17 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 3/4] usb: typec: hd3ss3220: Sort header files
Thread-Topic: [PATCH 3/4] usb: typec: hd3ss3220: Sort header files
Thread-Index: AQHZC+bUcStJQzY4j0i6iS0+2essW65lu14AgAAHy3A=
Date:   Fri, 9 Dec 2022 16:49:16 +0000
Message-ID: <OS0PR01MB59222DADAF2CED4DB1F8004C861C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20221209155623.29147-1-biju.das.jz@bp.renesas.com>
 <20221209155623.29147-4-biju.das.jz@bp.renesas.com>
 <Y5NfWiqhoPhkGGjG@kroah.com>
In-Reply-To: <Y5NfWiqhoPhkGGjG@kroah.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB8015:EE_
x-ms-office365-filtering-correlation-id: 15a14ae1-9024-4a9f-92dd-08dada054f8b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mJ+iUMiqhH5SSXrVUXG+5u1qmcLvf4vxMZRiiAH0B4k3Vku1YDGQ/EgO7i24qz8og/zNoSHHvg08fPbTRn6jU28yg6VUm9qqht24kH5B5VxFNMQwjl5cdts7cLxIUZZqJqyJCANjIebIfC6Y1/tdt3soejJjP/TARptGuJ8QhI/m2FPMN7GmLUSFkVWORchCHw/evz0Z5R5quj3oF+xWZw1WlxlVMuSlS8Ejm2ML0gOAl41CJKn6oca6gJClTx2mm9s3eRTdXsqoJtiYyOTxKSDCvZ6yhPz5IOONH1CVbHrSuJ7qJmG20QvP8BKcLtDE1bojlS5OHYzkTkyJpZTk9FaGRwpZFADwQklIDbCJmoN15zeZEpOs6+yIxEVyKjnCFFNGVXW/gR0te4sDGJP3dHJ7GFjcyVLqHusjYnlo+5qlbl34oEC1vF8KDPuygfyFc7xMCDcr71t75n0hfcRZJrIcWsgwuylIYdO68CKyXwIFo7gBEYVz//uI05VBv2x+AaLpayf081WW+G1aXwvaFd3r28wWobL9GuLaiPBSYPZ+hOQucXy6+A1Yw/Th1/gUjFjHDhSWf6mdH/IkuVzEr/T01CRtd41bgTHHLGWfxstyfPRMUrIx7O4bYZ8npi0okDlp0YWZjMmoNM5QbLXXhypWcV9jTxwB1sFomZTP9rSBc/RDKoaS1gjdUNPpzHLpRP4HkLsjv0pYaws7E3ZVvQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(346002)(136003)(366004)(39860400002)(451199015)(33656002)(38070700005)(86362001)(38100700002)(122000001)(8936002)(8676002)(4744005)(52536014)(55016003)(5660300002)(2906002)(66476007)(66446008)(64756008)(66556008)(41300700001)(4326008)(76116006)(66946007)(26005)(9686003)(7696005)(6506007)(186003)(54906003)(6916009)(316002)(478600001)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?WSjYTfFkoaLN7Nj7ORBp2jO8SiqnODhYEChlD7V7Ym6fKW1hQbni5+452Whg?=
 =?us-ascii?Q?9ISp+ZNnY/8sMES1ob5ibiU9947+R+A/4vabI+k5qkzXOY/MZKVM1kt2Dx5I?=
 =?us-ascii?Q?LtXFUSnj/iuGXddNuNHp19WYwkcAlytNgsTq3M0Ev5I+/QiBEHfkiAayNLm4?=
 =?us-ascii?Q?avdlfWHMckU8PvrJ3SKXoKxCPc8XEBK44Uu1KRBfUafAcrX8wB9OMnDkBbbz?=
 =?us-ascii?Q?18Vxd64qKsRt6/vj49W8cVL0uTrTM5Z3xzjyX2t00R/ULWMWOEOg/cbvFqo9?=
 =?us-ascii?Q?yp7KYSInX5lrMUhs/w8f0m9v0orKwHYw6OBz2UN5RBnT/XPvye+5p/o8+dDf?=
 =?us-ascii?Q?4OpytBlyPEkYCIhAg5hOIOceWXpu6JV70HFrNLu+ik4/nkWGIUGa/A1rLOut?=
 =?us-ascii?Q?P4EaiKJSqH0IIrWiEoeinICu0IIDug2m1oSnP0USOe1q9tuv1VTdr3lSUuAU?=
 =?us-ascii?Q?az2Fnpi7cTppsGXrwkIHCI0YrnwzqN4hLelje0TaV/+kv4k3uYg0eL52kEvT?=
 =?us-ascii?Q?YO2RuumkUZNpdQlQn2dfVfXg5iyiyoI+wKcrqo01mCWL/jpSLRE9iBjhfCpN?=
 =?us-ascii?Q?1k26OMGIrjgrnKP2PFpMQb3t8wkKSBbOBcnml4AZYw+xYEme6CW0l5kLW6MV?=
 =?us-ascii?Q?c8T3+S7Ob5CLFmO1dsbzHFOwtS7EhKIaUgxTSS5U9dWodEUlkPS7f3d4/A44?=
 =?us-ascii?Q?zhPHko7vdBOytV8hLQjiGiPQ4LUJBqQWj1uCw80cV5fyFNEmhNRfFqX76V8X?=
 =?us-ascii?Q?lJIJCa3O1Grup0S/lqDK+yyv/HlcAI9r/akukrLwFvXdkjNw6ccO9MR/O+iE?=
 =?us-ascii?Q?CM4sWFLBo6WuBK/4ufxKoQyXa5P+Wd/dwWyuY5c7XhHTSY04SGOu0iQdwsxY?=
 =?us-ascii?Q?EiyAdgdRsPYn/btieRgvJYUid0wNXlx5daMDH8tJWGZrCw7ZZclEjtwZGpTn?=
 =?us-ascii?Q?7sNXL42nlJ9WqjXC+r+O876kTqSlbHgOgXqivVa5C2UeBB13IoAkAibRU5Oi?=
 =?us-ascii?Q?f9SBRKhpXb3ASRR3HPRt7YC8Zt/k+SbjRhw/NduPOE45CFmu6wDtFOa6lJza?=
 =?us-ascii?Q?4Yv215rVUGYDbAIdPrlnLC1Oi4VnkGUydW+oKNlfDw+CH+EfrD66R7INd2PI?=
 =?us-ascii?Q?CzLpmvtuonUXxI6d1FOY2HMCT7HkyEOWPsaxOI41j0dB809jFPkFVLih3y5d?=
 =?us-ascii?Q?ItSIhSHmEfTy7Fxxf9EzMzNqUmmsfWX+uh5JbwX5xnzrelc7i9m89hmL/Z+R?=
 =?us-ascii?Q?5K6LyXZm3cznXDgBpGG46pk3kiY63LVkRLDVzSIvgaddN6PYWN1pcUrfPSPC?=
 =?us-ascii?Q?gsXY1z9A2QyU8/Uoq+P75tICcs73xXR0N5yvtRciy49AxDv1XHeLqFv1zSai?=
 =?us-ascii?Q?ZCosJki8LQCVX+cWFbyMsJsVop1/dPRZzBbHYqKjVogLucPYqWqeu7E00qla?=
 =?us-ascii?Q?xw1+lzqsWqTXoIdIcI3PRMSYuS+mp8v3iqWkjCRRwjMcSxWJIs6rpjCBcUwY?=
 =?us-ascii?Q?KTjCOAKSjN6dcZUeDIeAf8M4lUCbwGBpNMQit77G1iaGEWoAc+h0+TY3C9p0?=
 =?us-ascii?Q?4ZSvQGnT0QYXRxVcq5INYag6z0fu4TEn7++hrOxmDRWor8FgLleriVtQF0/O?=
 =?us-ascii?Q?Rg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15a14ae1-9024-4a9f-92dd-08dada054f8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2022 16:49:17.0116
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KpgtD2qKQVDS5H9yut05VsBdIwpiWIX8AwhwbQt3LWxwbYS4+xQ56E8efHFqgCkwvnzX9HA6rBcoG10Zs3FyMTRmYpZZkn/0Ib/1JeWiiv4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8015
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Greg,

Thanks for the feedback.

> Subject: Re: [PATCH 3/4] usb: typec: hd3ss3220: Sort header files
>=20
> On Fri, Dec 09, 2022 at 03:56:22PM +0000, Biju Das wrote:
> > This patch sorts the header files alphabetically.
>=20
> This says what you are doing, but not why.
>=20
> Why is this needed?  What does this fix?  This is no requirement of USB
> code that I know of.

Previously I got some feedback from other subsystem maintainers, to sort th=
e
headers alphabetically. Based on that, I thought of doing same here.

I would like to drop this patch, as there is no requirement of USB code to
sort the headers.

Cheers,
Biju
