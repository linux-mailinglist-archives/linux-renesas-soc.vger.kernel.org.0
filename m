Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E0B2673A44
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Jan 2023 14:32:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231248AbjASNcM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 19 Jan 2023 08:32:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231206AbjASNcF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Jan 2023 08:32:05 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2138.outbound.protection.outlook.com [40.107.114.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97C8B7E6A1;
        Thu, 19 Jan 2023 05:31:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lYDdkOVKSb31c/zksLv7tJ+418emV26BpRTgoNjY5TxRCPnlwD7m9PwnKoaykxTvd+oG2APO+LUl7xGzKJxHNUyWHqE21kGJPldF18iap+uc621chOxXuPuem5G185OoNWqAjTqhxqexgseQ51HQcAP04WvGTawzTRAIzTk2oJ2pOYv/Aacv3l18Apce64PudH1T5AoJxwxEuQGhCVC0PmrP17fqmUa4BQ0uh8QRA0Ab8UsTvV1Rn3RDPSVFnuPiG9y0xhIehtUP05duMPos0rH0VHUcFK/fo4GrBzIzoenRSvhC7zP0EJChdzGa1Rq/oXgQs60GChh1LjohZMeOPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W2V+Q02m+WlRe+tQ47H9CAEUSvvQKFSxjQhBsKmQBKw=;
 b=U/M0S2yrG/fHCwLrDuDViqU9AsLXDHvOYwFrvJivNOKowMcxXm4mGZecdIdjBMvc3hXWANf+3K+bY/B/k1WA4H+WXThwq++aWEZ6gLi5MLOt5gNj/LJouf27GIyo0qn9SRri8TNtrWa3hTpFpxfE3wRklhAVUMqhCi6cILTQxm6o2hG8WFKTyYO/VYM2GlLsEb7DVowD2w0HmRBAusvB2nvbhd5PttBRb9/yhg5kFjKTrYjeWkVItlZgtBASNqUTpfFPCwqSfPPn5oOpMPU98Az1BuhqpjrxYVYSrVwtqmpL3/+GhTU7XsWfzdci2O1y6+8Dvdt9zvUHTJwbGgk1Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W2V+Q02m+WlRe+tQ47H9CAEUSvvQKFSxjQhBsKmQBKw=;
 b=bFG0hA2kIgoGbSP4G9x7YL1nMYcQ4Ab2pUoTmC3rNXal08febOKNQjXxKWuy+HM3nLPh6tdDYZy2y9tw9iskM/oXIFmxsFq5Q1BqH6UwBFUnDpcHnP5xwDNiy5j0/C1MCqqw08tKtmcPE7adfSrp4jm1HaMGlAMmWX1oEnhAm78=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by OS3PR01MB6007.jpnprd01.prod.outlook.com
 (2603:1096:604:d5::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Thu, 19 Jan
 2023 13:31:55 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::3e61:3792:227e:5f18]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::3e61:3792:227e:5f18%9]) with mapi id 15.20.6002.026; Thu, 19 Jan 2023
 13:31:55 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "joro@8bytes.org" <joro@8bytes.org>,
        "will@kernel.org" <will@kernel.org>,
        "robin.murphy@arm.com" <robin.murphy@arm.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>
CC:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] dt-bindings: iommu: renesas,ipmmu-vmsa: add r8a779g0
 support
Thread-Topic: [PATCH] dt-bindings: iommu: renesas,ipmmu-vmsa: add r8a779g0
 support
Thread-Index: AQHZLAiMfXACliUnd06YTlbcju5liq6lvD1w
Date:   Thu, 19 Jan 2023 13:31:55 +0000
Message-ID: <TYBPR01MB5341B89B3DF27EECF51507E9D8C49@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20230119131833.1008752-1-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20230119131833.1008752-1-yoshihiro.shimoda.uh@renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|OS3PR01MB6007:EE_
x-ms-office365-filtering-correlation-id: 09a5e903-9b7b-475f-f05d-08dafa218855
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PYvr4/CAb623QPwGoGGG2xzg4TPy/xNLoiahBuXaHxrOnQn0mKeocJGsQLRhx9Z8Is7Y9sSUTl6IhU6QwJb8vuQaikNmiyEJNjuRFFG2/CD5D0ljxAAvuB3mni9FpD2befuEj30+EBZQeH09m8+XkF83rq2pJaZbEPdNLs8ugzRPnEmNsVKmfmZmUiAwZjKI1OhYxst3hugiZzZQu1I77qH8xGl3PE8l90NdwRhP0IeCdaaUlZkMrzPMnle0A9Fb+/h/zq4g3dfrQuNJ3wYQvdYKltCxPYyw0TxHSwaLLcGgzRVvsHnlOdTh9b0CMocANhOBvC8LJRreUOkl6o8mFbqbLSxIdgzZpCbiTLnU+wP0NhS/gdnwbEGGS15GZwFn1pq71Izd5CLb/YJ8yx0G7IZssY3onpKlWDUhT2QxI95lDz8/yIyneJ9NOTboo7HCRXRr6SRwnocYyjDa62PV4XCSPdCHJSDkJ58+iqQob3kW4rf2+MMNjtZkrAEMz7cKNOH4eAVZfV4V936Qw7ZVqkGc7faZ09kkkyA+qjk1s8oERU2+x4fGDoTd1kytN+1HKEQcKs1YYwNNaH8gZA/8OcDehB45HDt/rzo9e95FMZx+xINW7pktQhgAiFmxUAwcD+CxT6nZM0KT1q3X1lrJiSLipYIOYaRROu9o4iJvBJVS4JcUgALQS04EJ0WA2VBBagNTZKPMvaDxww2zBNoxfQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(39860400002)(366004)(396003)(376002)(451199015)(86362001)(38100700002)(122000001)(2906002)(41300700001)(8936002)(5660300002)(52536014)(558084003)(110136005)(7696005)(4326008)(316002)(33656002)(71200400001)(54906003)(38070700005)(8676002)(6506007)(55016003)(66446008)(64756008)(9686003)(66476007)(76116006)(66946007)(186003)(478600001)(66556008)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lNtrEldfB7vovoux9p8vvF8ajB9kfr3b2QrN32nHySuV4ykHXrL6FZCr0jbl?=
 =?us-ascii?Q?ghPvUTVJy8V2DMHdwWqyeMpxSmYFueaK0pSU4u7qklFZMSfcETlL2RAwG2is?=
 =?us-ascii?Q?K5fG+fKFOHsoZKB1lrikzjF1DjTnfGTwHVW/VWzYvcnsQvMxi3OH5BLTgivP?=
 =?us-ascii?Q?7CUpwcxt1BuI/9SCoMRC1QrFfUcWLRNy+oqO3/jdYX8wroLc2agNnsn/3yH1?=
 =?us-ascii?Q?rtv/i0bn8tB0Hl07gxjXQ6C/C2tzk/csYPotgZ5qvHbadXeV8KDIrELaOd/Y?=
 =?us-ascii?Q?GkyTbB7O8vmJrYHMmgHaFdsAy5Iy8qlkoNSIz0ZDKKj5/PLyxFQ2hQwI41mH?=
 =?us-ascii?Q?9oDyNi4oZZdLaoD1tEewl/I0Bkfphbn5fcp0Rj9jo5xJoO/jUc3Aj2qFPGyh?=
 =?us-ascii?Q?GLFC6g6eXvxUucXPWweGzfLnnfLvPSBZOZThuOcD3nZb8Yh62sdX14faAWip?=
 =?us-ascii?Q?/gZysrowc+q2BcRgXwos8s06+gnitnCY4MFmSsqnrMmj3R2/1bX5g/uoMoY7?=
 =?us-ascii?Q?eGxbK6GPFyD/ri6axZQ0cM5GF3EAbtDdrlzZKz6n8X+f236DDEpo+vCoVO8O?=
 =?us-ascii?Q?3fe2d3TQ8Vpbo+DYUqbhr92gI6lJ0hqUWD1xpDYtv5nrnsUY0H1wqHVp7mM5?=
 =?us-ascii?Q?5UAnwpHu6HXQtjPSZ5YkKZB3Cu5vq5+6SPje/In48K1hCCTrFxN7/0HVsALq?=
 =?us-ascii?Q?6ek+UTNItIouATbYrUksik/gV8UXFAew+S2YdVLxFrDSLVoHF/qlU4QMWa8c?=
 =?us-ascii?Q?l9Ej0Bn9iDWo5q0sN1de7EnQFGSBqAugMx0M0vjBU2id9QRpYsK8UEXrdbC8?=
 =?us-ascii?Q?fahE+oc/5G+9RTJZHDEnEvIRWQGKxK969jwpo/oVNcVNA76BZRLXlv0rxL3e?=
 =?us-ascii?Q?3PjDliBaYmxK0RcJtYfD4f1Ur6gw2wAKhTsNYu1Lm/nw1SXnGCHBfDPaLqkg?=
 =?us-ascii?Q?q8bUaSiExkT93cfnQI/GxcTxZjOlW7y0MEquVks2Vdtt2TOhB0gMaTuSOQCh?=
 =?us-ascii?Q?AiGgM14TCfDdSLyrmE5fH2t1QwD6TG2PfjSDPUX5zMEFINhQDLgQudYpjvvi?=
 =?us-ascii?Q?LACF4Mx4C0jugf53nShZSVGmaxiGcpKxorqQ6froHGOugNfb7pTSTuvx9sp3?=
 =?us-ascii?Q?7AaLaMEXGuoEUkrohhwdmwQCXRdOgGdwF+2dDXhFdqCFzYIBgb6cfTVLAfs1?=
 =?us-ascii?Q?KX6+BhuGA+4joK/cBEqBBlZWqdJ7Nze/r/5uWvA9OTlhOd9wCcvPLY1mc/Ee?=
 =?us-ascii?Q?LQRdINRG0GnzHxBuPCtVx5uo7AfLIIpZvGwa4hooCh3B+bKqbt4cc9AeDmdy?=
 =?us-ascii?Q?EFlH96IWcsSWqU8Tab/EEBdBNkwKV7ZwZj9wkhnGy/nb8Hc2hLisn4FqVY3k?=
 =?us-ascii?Q?e9xJfd9XSoU7+xuz/rn/1FUQg5MWoDJ6wmhJ0eEY/zQx8FkfczK8MgfkTIVL?=
 =?us-ascii?Q?8+HLrYVlN3grTgx54gDNdekd3tUYzT3u+SV65WvVlSYQ4zexR6WcO5Dk55z/?=
 =?us-ascii?Q?QzsNWBse0KfVZFL7fL6YTK3EG8TTN3nqAMUhi3heiX5h1tqyC7FVDAFMQb5y?=
 =?us-ascii?Q?3j3lHTxCQ+kRmCDq3CRIJ6L6PkmnVohAWaaPRQ4i9iUee9bc50WprTLv8FKc?=
 =?us-ascii?Q?vQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09a5e903-9b7b-475f-f05d-08dafa218855
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2023 13:31:55.4076
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wYp+iZ579P0rziZ15BVqB0ug0IVxZ2a8LxnAst0TLHlWmdlbAoyPIf835dM+Iv2ja8RmCsPaMBuiTHgWwKLElps9YuZMMxVXfvuiMhbnfej2g5UmAhU6oE9VZP98DlpD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6007
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

> From: Yoshihiro Shimoda , Sent: Thursday, January 19, 2023 10:19 PM
<snip>
> Cc: iommu@lists.linux-foundation.org

I didn't realize that the mailing list was ended. I'll repost this patch to=
 the new mailing list soon.

Best regards,
Yoshihiro Shimoda

