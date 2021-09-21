Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79F48412D5E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Sep 2021 05:24:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232173AbhIUD0G (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Sep 2021 23:26:06 -0400
Received: from mail-eopbgr1410100.outbound.protection.outlook.com ([40.107.141.100]:13920
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1349571AbhIUChl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Sep 2021 22:37:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ENWVnFzZLZyjqVdCzbwMeaH3c9pCDVzw9UveA83h/as2FFo4TERvaeFJANv7P1nHv8chv5ZbWA5Cs8lKcPjDN7VilFpNj+9xKHoEtpYCwTsK+sTolwikDCZVUOiqU7yQb9ACbCwlq0LwwXoVmvpUONwkF/qVKn51dhZO8rj+D8GQz7uwatn3E65Iyb8nAn40H8/m6ycKa96lrPHbZL32oGdwYl0LeGLcLAqg8+gUaQ8zhGQzfmxLs/Uy+ibnsTQo38fcvUtR4MQHrRkrbsxzEsGrNproe7GZQtZLX1BpVPGtKVhrYh/Its2D68pn2JJa7+nDH2lo4xaK6FyjAJgekQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=YsY9E3uqanu3T7B1vK0RyH4DMAf+e4PhYjev8IGlTaM=;
 b=hEu2g95Qfg85Oh+X8VEmoobY9XVd4PZ77KL3xHSCmDNFMRyjvxj2BauP6xrZiNBqOmfrtTexqyQv2imPHeGTjKpn8B0cS1B7XxQVMyUkV/0gWHg0AZNQusrY6Xhq/qnw7YtJ/v2VexzwSjOKOOkw7LEOWqn/PSimGiDKSZr+dYg2NPrpWBu/zbQ471yY6JQ1FrfYD/RzOnQyMuGWcVszR00K7odhC9FoEza3lTDfOtxN3YaNlw8ZHRp661PiSIKXaZpHI5PO4mkJLw4Owwgs+Nt7+iC9mnANjoWJDT9NU3kvktkwq3a5u/vOdApQXz6s6onC8KX3ocxxikU+CaYsqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YsY9E3uqanu3T7B1vK0RyH4DMAf+e4PhYjev8IGlTaM=;
 b=doLbYA4ddfgjdw1daBqGEYE65mDgv1Yl0mKiNQnZ5atVwPw3IJ8oOHNAiB7YIGdFFF/ZeuHYjDSdQS1aWweM14wL87Y8taJU9Yw/GJzT+zn7P0oRdTwYJ0mlg4zQmmsoVQZ1Xo6MmSwTR3ON/rvrbsR/cVV7cPDmnQuWkyI9GGI=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYYPR01MB6665.jpnprd01.prod.outlook.com (2603:1096:400:e2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.18; Tue, 21 Sep
 2021 02:36:11 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::5885:70e3:e339:dd7a]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::5885:70e3:e339:dd7a%5]) with mapi id 15.20.4523.018; Tue, 21 Sep 2021
 02:36:11 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     "joro@8bytes.org" <joro@8bytes.org>,
        "will@kernel.org" <will@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
CC:     "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 0/2] iommu/ipmmu-vmsa: Add support for r8a779a0
Thread-Topic: [PATCH v2 0/2] iommu/ipmmu-vmsa: Add support for r8a779a0
Thread-Index: AQHXo8Kll8J4SkmMr0CK6QT+ugkceaut2r+w
Date:   Tue, 21 Sep 2021 02:36:11 +0000
Message-ID: <TY2PR01MB3692DC2225095CE24F4F4512D8A19@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20210907083020.907648-1-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20210907083020.907648-1-yoshihiro.shimoda.uh@renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: 8bytes.org; dkim=none (message not signed)
 header.d=none;8bytes.org; dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e5606e79-537b-4ffe-e714-08d97ca8934b
x-ms-traffictypediagnostic: TYYPR01MB6665:
x-microsoft-antispam-prvs: <TYYPR01MB6665A8391300912912C87B83D8A19@TYYPR01MB6665.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1824;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fwhM0sqPiIexP3uCOZOArr76S3ra3GiGj7mdALzSXWE4UZfM6XlN8vHM1ZvWMSRznK0Lz+JjTtQoou0dwZDebmIuNU9YdOLIb6Ny9dsPu1rm9CTT0quvqP2s0pLBjb/k6BqMxKQh3Ij/2YjEraAwC5sKPv+kZ2OV3JL2bxdBh0HClSew4lmBppD2R/AGFjAtRwPMHwKuB56Yrasn4FZgMjtlYY+z2In8zr9IGUQLj0o+0YBQZQyYzp7zChXLcpfDyk9HdAgYFz9Y6DsFsNo2HJAMM0iz+E7NIF6r+58qpjzOzhN2ifeJNDD5+9plFO1ViTZQGlADhcNtG2eR/c8W5onO7ipQ63k5eQk7cynNLOUt1V6jzrY/dwAYKwtvFv7gt2MoqeVt1mJZ03EWdI4Aw8Er3xCFNT7pdfh5AA44xBr5N1RCRDLWuTRBjNdNJi8S2Zl/uY6jGNWvOXA3cPpVFvtNCiRHlrQXgCwXHwZjCD3FFlaSbhEWZelPt3uO1BSKjB07fMtonxFZDbxuVP0OHqh6Tq7SWBK35lLou4Oraqats6r02HB/3vV9PEZ2SdBPe8ccsQOUJWgyEMOZxmFhhBpeJvZVpBDn/qAWoEccEjnJqJHjhePT3e3jF2nxfjp1D97Oh/xWoS5Q+XeItWNaOURRQTO9D/aiYM3Pwhivx0rklAw7hJfkwi3KPyv+ME88KRGuv7BQfxPWUfv2BTlBqQ2lRXZCkxp4NyEEZJdXA3W/GOPHoURDDfR+4xDt7LXIkyGPE/Mr2VDIfOXMjQq4hQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(8936002)(186003)(508600001)(558084003)(38070700005)(122000001)(52536014)(110136005)(71200400001)(8676002)(2906002)(54906003)(55016002)(4326008)(66446008)(66946007)(33656002)(64756008)(55236004)(76116006)(5660300002)(316002)(6506007)(38100700002)(66476007)(66556008)(9686003)(86362001)(7696005)(138113003)(98903001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Sw8eN+3Hy7KbtaBvtRdi6WPeUaBtLPN9WHo3ocBWvjLJVS6xhZQkNOZrttZB?=
 =?us-ascii?Q?+TOAGyis6nueyPUKtcaHHMkvGvxbRngXd4Id47/r+u97iksD7MljC+d7qa4R?=
 =?us-ascii?Q?x3V51y70705YIq7JkT+/tLgx4cYKm6GUGV7h0NssQ75K9w1fWWhQVGNWw90u?=
 =?us-ascii?Q?6Dw19LAGYRMnBq9tPNfaDefgeSkm9Ajq+2E4J2j/Y64IsmCqec93Zuk+P+xT?=
 =?us-ascii?Q?wUi2bSbLhZW61eGDhEKVNEMrXdT3DdUgeMWQYGiMPieK3+K/MeMZs708aBal?=
 =?us-ascii?Q?DoQesvh4qWybB/opcvyAEzhb4hecWE3u1ZFkpecLlPDGBZRr1Cr0+Ir9lIM7?=
 =?us-ascii?Q?XoqKJajSl4AcyQdK9nSOGN3p9xOYa6axEmnhKmxjIeVnBE/C949Gt2Rlim5x?=
 =?us-ascii?Q?L139j82dORQLLXcx1ql5pFs/6jEjMIRIfIa9N5xrvAxMYbHQiDcbP5ChBDIb?=
 =?us-ascii?Q?cgsWKr5sxIHyne+V0jLgvJyxCJkN/razGeh+GMJ5e2G7FyiKH/8SrkvVk6B0?=
 =?us-ascii?Q?9lCLMpkQ6GwdyY2KbYrN/O4+ZWcj4Q9vU+pbFpm0tLBe7ABxKDjDgoayAHnM?=
 =?us-ascii?Q?p8/zljWmr8h7ns753vdazfuEdhlfnQPIH1HLRJ5y0M8oSySzVIQZ4ifOIv3h?=
 =?us-ascii?Q?LFI7W7TUx4tJyWRUH0hVFaQYuJ7iwh1L06JWLDq808UHMvmkgnDd447ng2JN?=
 =?us-ascii?Q?Q6uKp1Uz3k9aWnByD6J0mW8Mp6iu+yhacX8mLjTJiyzuE9Yu+7y5oXM8DOFv?=
 =?us-ascii?Q?RbZ8Y+IYK+6v4RRa/StvBJ8HMbvxe9quC8vTcrMSEsL9shLJ63eo9BRQloNN?=
 =?us-ascii?Q?oROBubD3s+PO2vrrdNK8YSnntI3Biu1Ty6a91n/yRBV5wPbObLolSFfj/kIl?=
 =?us-ascii?Q?rC4lKdqPxHDbrjkl9CGbNsKd+bO3pMoQNT8DgcfMk7Fqpo/oXMp50Kqap4xz?=
 =?us-ascii?Q?EdejCVI7n7Cpksp2l6wGZ/TMkq9IUXMy56j3CxRGbHvR9PqUHqm/k/YgWCy8?=
 =?us-ascii?Q?QJD9CEvWLWm1fiNfkRD2V13MvgYObUNbs0qmxHAME8APObHQh6Cnhlo+AsTc?=
 =?us-ascii?Q?1LXa1LCBELHCoDzMsNmBtqvzyt00ZO78UsRtqv+d4KinwC/25TP9RW46pMjr?=
 =?us-ascii?Q?6TqNbr1Vy4GaUA+zQlYXHJ7Wf8iWLAIopfsPjlWLd608+d3321HFEHkOGph7?=
 =?us-ascii?Q?qldbpUiFkVSwPjN9y6/NCba+eC/38IUw/F4+GnuPp+lhTb+r/GtpxSD3AMA6?=
 =?us-ascii?Q?jt538d1w4Nj8VstJUxZddQw2p6fLdB5nY2dwxY+frvO8KIc7e1FBT9SxXbT4?=
 =?us-ascii?Q?kuqMA1HUd+doZP2thwfh/EBP?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5606e79-537b-4ffe-e714-08d97ca8934b
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2021 02:36:11.5551
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MtK7jCqxJUAzAU6FA79AU7PO7PlIyxuya3AIwsvZ5BWMRdtFUAwDdYZV9w6QsFiwMRLJrO7sG8woyOmpvm4LWnG9uunsFSiCOel3bFOJuKJ2dSF3+x2QNrBrnN5FfBrH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB6665
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Joerg, Will,

> From: Yoshihiro Shimoda, Sent: Tuesday, September 7, 2021 5:30 PM
>=20
> This patch series adds support for r8a779a0 (R-Car V3U).

Would you review this patch series?

Best regards,
Yoshihiro Shimoda

