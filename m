Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF4363B26A1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Jun 2021 06:56:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229721AbhFXE60 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Jun 2021 00:58:26 -0400
Received: from mail-eopbgr1320092.outbound.protection.outlook.com ([40.107.132.92]:36067
        "EHLO APC01-PU1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229464AbhFXE6Z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Jun 2021 00:58:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gcURCDMoqyZAA3pGUMtvkU8tnic8gZrnKY8S0cXWV2Ns+xcKuWGGyr9QM91WbCAfXpS5TkYQGyzigm3eSLcuuMEe+DIa/aJ/T16SLIr46q91tOGdHNnC0alUtHdXMN15Ssswp+aMXLPRLmDrVICHT+mKvmH+B8f8ur3v6fgKgNQiL5vCgqHmHJ/0GzS0h8p7cQY5yKontnlUgKsYvdzSv/0AOPdYfJYqLAvpq5JbJzypCG7H391Q1Q4mP/7QF0N8XN8FltSM5IWqf8rMhcnCP6tHVX0b/4xqRZwYo/8zuK93Gtz5sH4QvdnAI0UbWzvPGOV6k+CMzke3XvcPoLWb6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2KcVzzXmtEJhDPNN1iQIERABqcDcQHIFjObjalFUb6k=;
 b=hBLMI7xi812vxC7Qc1yjPkpBcD9oIpy/lYGeM/UcsjtazMfsOymlzQOvvLX9+D/D1cy4Yn10EGx/h7Jxticc2olrGfZd6SJHl3M1AJPH2xN4+05QVxHJ+T4U/Cn3Jjlrh192S9UXfPFg0wg8U5HzS6tvbxXFEkds+ppW23y1aOoKspJ5RlXQzo5vTYE0ne1izO/DGFUUT7l79CGJgsir5SSv3rRciL+DGQoXswMU6orpFj3Y0GqLKebufXduqEsTHC7FoRohbt7U14SD9r7R6Lr5UX5ogdnBeF177gPhyQz14CzVbaG/VmLSMw8JTcout5NYVrW3ip03hZJ+O3geBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2KcVzzXmtEJhDPNN1iQIERABqcDcQHIFjObjalFUb6k=;
 b=MxZuH5wmGP4R92JR8oUSoOBoga+798E+u738Zd1HMNIw0+Iozpi/KBEYJ+i4LWdcbKES6Igb/DwOr2w2QfnhH+neGpsmayLehsx4+FJ4pq6Rul5xkvnsQ9zHHEiq9U4SiZeDyiXBrXjcA68dlrILQcU356tcn7R9EmgZd1ILooY=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB4300.jpnprd01.prod.outlook.com (2603:1096:404:10b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19; Thu, 24 Jun
 2021 04:56:04 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::4c5d:66ee:883a:72a5]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::4c5d:66ee:883a:72a5%6]) with mapi id 15.20.4242.024; Thu, 24 Jun 2021
 04:56:04 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH 05/14] arm64: dts: renesas: Add Renesas R8A779M1 SoC
 support
Thread-Topic: [PATCH 05/14] arm64: dts: renesas: Add Renesas R8A779M1 SoC
 support
Thread-Index: AQHXXdxG3XhmU3Ghv0CO+jMJ1d2pUKsirlzg
Date:   Thu, 24 Jun 2021 04:56:04 +0000
Message-ID: <TY2PR01MB36928C65463E91D028BB5F64D8079@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <cover.1623315732.git.geert+renesas@glider.be>
 <96a1cfd2e8d86e10364fa330c6053b5136e82939.1623315732.git.geert+renesas@glider.be>
In-Reply-To: <96a1cfd2e8d86e10364fa330c6053b5136e82939.1623315732.git.geert+renesas@glider.be>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: glider.be; dkim=none (message not signed)
 header.d=none;glider.be; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f52049a6-cd95-4ecf-c4ce-08d936cc5ee6
x-ms-traffictypediagnostic: TY2PR01MB4300:
x-microsoft-antispam-prvs: <TY2PR01MB430094C43E8116E8B660F1B1D8079@TY2PR01MB4300.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EPrCdWMTq8FI4ROwnEcSSA/jIz3xhI2Xl9D5qlxbiTw0lKmfTbKJLtVqE0sZRXrL01aLFm5zk80tCe+10R8KhpcLHdSuGhs3l+treDRthUHovpqCOfcdcJGgaX/YN/HkNZklaUxWbqMKY0+lJM5IH8K9UwcUgYosO7Rug6C6lnuQltisVTBWh21qxi1fCkSW+dy7m5mY6xus6RsWpI6qMuW8rehEjhlZq/jZhOR8vtO5rwt8wQwh3hDRy2hbt8l4k20LxAxSInltJOki/EIYdqiotf5c5xpGlgk0WHPz5P44ZYRbabvAsPQffsjnEUd5kakCu2C8Pw9PC6Jwn7+QLM+XhqZ5IoPndtEowxUZ+1xMr9cB+EDfWpCztrMEnaYMIiYEPawbzdf7ZPY9OMTbpvYMHYn6cPCpNO5Nvj3hySuAoJgLiLNI7YEDng3BHvEQzAIXJArI0R+gof0TlSnsVPj2ABa6MxvteKZbyiznhIJxhlqyIygkqj5aiASqsAuI3o2SgvLA9ZaiQMobWu4VQrQpvFZVlEZ5eUTUWpZFFvFb/u/aGJt0atuIwF//iOJQeWJyCNsUtqDFwfTtkyZRLiUHsmdSTPBjt3pOssnJtIy4H3pHNKYeAhV8aWvRMlhovIaLZ+M0ANZ/h2iltyYVHg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(136003)(396003)(366004)(376002)(478600001)(66476007)(66556008)(64756008)(66446008)(4744005)(76116006)(66946007)(54906003)(110136005)(6506007)(122000001)(316002)(9686003)(7696005)(52536014)(5660300002)(38100700002)(86362001)(186003)(71200400001)(55236004)(2906002)(8936002)(4326008)(26005)(55016002)(8676002)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZClC++Sio4K+Mc2ake1hTHDdIfGolItNZiZSRVDMJa06AUNPHAR2c7AmPJjX?=
 =?us-ascii?Q?PezKHRxMTLairgPCVUyt9LmK8Q1IownByPOmVUbETTCOAHFBjGWBFxptjnFH?=
 =?us-ascii?Q?9FDls93q78/IHgYJinRWwWnB2Ao1liMbcLqrPRO0aPFwE2K69zCn8LKsgSjE?=
 =?us-ascii?Q?pgnD3VK4lmpHMWeGTqyu32104d0Rx6cyV76XcFaG8UD1ErE6mANpj/36cQwW?=
 =?us-ascii?Q?qGZlKivIEJSPc66lFQaADN9zIX0A4ia6CtSCLpiFOBvi2UkJPnkhGalnJ3RQ?=
 =?us-ascii?Q?6sfg41PdmM7HBY5O5gezp+gOV1eGASQM4suuySz95U/S6mGnXdj4bCKMxbHN?=
 =?us-ascii?Q?TXqXMp4Op9hunQh6UgZmoEzj6EqHYGHiEj7uYXe2u3zbF7tQQgcq2yiDmXaI?=
 =?us-ascii?Q?W71mwrrPo1FoQtEMXAZjhXG3FvFM98dG3T9f4M4r0qZleq5xSaxLILWlY83O?=
 =?us-ascii?Q?xAjGx8e6u5OlEzRFUhKjbDIsRvA8Nur3tvaKNmGSOPJvllYdJLC25PHvHiyD?=
 =?us-ascii?Q?kPfKf83E4EDopFPRmsyMw7+j9bXsWl3FZr5da5UaYULxmiTCiucq7iEPyEL+?=
 =?us-ascii?Q?8FaEaJ8saFAAyAtuk1GeV1/KO920AsXJQ8CRJpFbZWWANdHwNvRNYGy1zPrX?=
 =?us-ascii?Q?W+f2vZpmYCCK0sCjHZO30luaM7NxscY9M/QAgqoG6AOdHOF438xBdFhDcCXW?=
 =?us-ascii?Q?cyWS1rTIo6nysH4t4Y/xVtmymxWzM7ocQ8L+/yyjx55517KHfDbFSFQinlcT?=
 =?us-ascii?Q?Nk3eUXUMmRnUO57V8QqrjUbildUFTe3bK3vTbL6nQJN6uOsF3L6FGjzvQlYl?=
 =?us-ascii?Q?cNIxOwqO6sZBskO2LWgZra3SdxD/bV6RjSFBUo1JmUN3PAu8sNVvGnLBnzem?=
 =?us-ascii?Q?VusdDUF39HgKZyJBShx3021oLEwihlFkfP8ASuROXfkll6xUsrwTCB/BVIjK?=
 =?us-ascii?Q?ELB2maWTphMo3A2KTxHAsnTLbj57sRuq2gaQd7vpbNhbjPODLtQCvrXL+Gzk?=
 =?us-ascii?Q?v79oe3mOR96g7nsHWRKZGAB2i/pVZuPoyhyvYD/pdxbRWI7N0fSoNYx3tBXn?=
 =?us-ascii?Q?VVGTsgb00NleVZCuIlguvUdPqX18zSM4BmBggbjKdQpxD41OD1wnxYPbbrEo?=
 =?us-ascii?Q?GPAZrNkDwP/f2xI8iKckfzezor6EPIqhD6lPo+NVzohBzVAV5PI2q3Sn1OF1?=
 =?us-ascii?Q?rhycYDWRG2UhuMvzB3IsPa+LhWmSlqSpU+DCbqb2bLXFq9tGeR8HXlFSk9mS?=
 =?us-ascii?Q?GMF5kH/b15dgl3u/FaYiVEti2oB+D+xe15mzbCkC3dXBrKiYDl+AiiylQPs8?=
 =?us-ascii?Q?ZxGKoH/fprShe597fBMwBuyB?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f52049a6-cd95-4ecf-c4ce-08d936cc5ee6
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2021 04:56:04.2236
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3of58VxeXF6ux2/+YTeyDkrHEh9NECJsRBRF5WfkloyHZA0PVjox2RjvjStfS2bL2XKSw37aA8HAryFYPmOcOG4SHq9yX6H0f0vyimoGdV0qmjHCElPdjcBBn2oyo5J4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB4300
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert-san,

> From: Geert Uytterhoeven, Sent: Thursday, June 10, 2021 6:37 PM
>=20
> Add support for the Renesas R-Car H3e-2G (R8A779M1) SoC, which is a
> different grading of the R-Car H3 ES3.0 (R8A77951) SoC.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

