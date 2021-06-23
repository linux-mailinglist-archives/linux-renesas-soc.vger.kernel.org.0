Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76CAD3B179D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jun 2021 12:01:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230109AbhFWKD3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Jun 2021 06:03:29 -0400
Received: from mail-eopbgr1410101.outbound.protection.outlook.com ([40.107.141.101]:47472
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230064AbhFWKD3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jun 2021 06:03:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kI4hLRCRglO1FiiRcgjY5GqkKJhkNF9iFtaHreFFzo8co9ATlpZX59t5zGqni9J6k8V6t8K3F9iHVcXMMxMEp0kjTzklcglzuD8zqjQ+tiIPG8aVU90sR5UqHT2QkYX3tTooh64vz7V8q5vCHFaAIU9EMSMNgNtnTpV96o5Ro8xbTf9rb1aHM7Z92KskBC5c0Oefs/cCIEKfx8KWPLfNDT5WYGPmoHuu3TNSz/aGqUbM/GySnK3JBndjGZwrbDOlEth2udwqAlFy6dxOkowKCA45sZHXxa4dCByNMcSSjl89Jc+ca/lOOCa+dO15KFD5hw/ev52r2GrsS1XiTu7ROg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iBHOpj6vGmV6G1otyQh4YHKlxvySAsrm3I8YL+6SVHI=;
 b=H9GbHhygznp/1vV9MZs0HkqH/9q1EIZfROnk/nfC/RNslblB9T9qAMNXVKBk0Jn7PdzyXXFpDoUpX4vgwE5nzRF0l4gmoiU9NfpgquUDoj84Ot8Gv1fjCnB8/62GB6/c0wHseujrV25d/Qc6gj1pCFHwdNL37dVf+o6nCdsYUXeDDw3dBdTQB1HhCcjkAmVFzJtVIZyVEugki59lNNmE+Ge77nEl8JD/1dKSwr+lQqIr/hjjcx6JxfB1qAUN0qMR+WP8nIWpAVpNeixoY/E6Qb3cikbWhD1EENaHr8AzhpUcIqrWVpl4YzALKQEj6wfBCzVLkGR8xnCQSmK9XNggTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iBHOpj6vGmV6G1otyQh4YHKlxvySAsrm3I8YL+6SVHI=;
 b=nkYyr257trBvrYoizOTTCu7JiV4CuMnKnA+ckn7bIe1HXrz4Ueui4mGrDsuUjsKpvmUhQ2qgZLNt5Fdz6KBi6WQ5vO4bLnRb5j9kJlX5IVgJ6F2dJ7JBoognl9GjuctzclKrmu6j12IH760LKo9DmZRMjqSo8b36KiTYXMkKiHQ=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYCPR01MB6429.jpnprd01.prod.outlook.com (2603:1096:400:92::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16; Wed, 23 Jun
 2021 10:01:09 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::4c5d:66ee:883a:72a5]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::4c5d:66ee:883a:72a5%6]) with mapi id 15.20.4242.024; Wed, 23 Jun 2021
 10:01:09 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH 01/14] dt-bindings: arm: renesas: Document R-Car H3e-2G
 and M3e-2G SoCs and boards
Thread-Topic: [PATCH 01/14] dt-bindings: arm: renesas: Document R-Car H3e-2G
 and M3e-2G SoCs and boards
Thread-Index: AQHXXdxGXQcHvm/zkk6EidcV6ivjeKshcVyQ
Date:   Wed, 23 Jun 2021 10:01:08 +0000
Message-ID: <TY2PR01MB369291D8DC384944F16103FFD8089@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <cover.1623315732.git.geert+renesas@glider.be>
 <f79841c1881f8b9a2c10fadb3d3ad6cb5fccc6a5.1623315732.git.geert+renesas@glider.be>
In-Reply-To: <f79841c1881f8b9a2c10fadb3d3ad6cb5fccc6a5.1623315732.git.geert+renesas@glider.be>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: glider.be; dkim=none (message not signed)
 header.d=none;glider.be; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bfffdde8-80b4-40ab-bb50-08d9362dd349
x-ms-traffictypediagnostic: TYCPR01MB6429:
x-microsoft-antispam-prvs: <TYCPR01MB642910E11177421AFE8AD7CDD8089@TYCPR01MB6429.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 77Hn06CX9csVe7qoIJPMKaBpNPGeoywfVxvtvetJcX7EfrKQfKW+NqBhffJXpjKHPBPhhEroMef/9s7nN1lQqHk+UUY6O4Oz6G1OtY+0b2W5DCqoXmKOQQvwpppLp5gJ4GCftYr6u246NzmqAe1UDTz59Chi9r2PaEjKm6eoIeNCNdTAjEdg8eT+xlyMZ95RPiY73epiO+6TBze98M6YQkR0FRIzWoA9pxKFu5AKVTGBTRa3ePvz+Ru6E1AaO6+gz9lcEN6zEXsYDbmusLDLnuOLvBH6yz+mUYSwR8CzCsoLEl/XRLYYqfBzwWyfFHn54LaZzAh+5Wd12+zICbzMxSsJdTUHonxrXdkum75/KVdruHnKGIyDLAOWO7w4jXRxeecRytGSKGBxKDppshwI/lceWdI2xjWET9m5IIoelvNPVSb0e32DJS6y6+bFllQNlWD65wA0zHljOZ44zZ4Wql7Kxi9ozdG2WFiC7rj8oCHR+Jie9fNbk8tgCyfsU4J72s0I3U+hM0XRgae6MRNYwcSUfejTwfGuOmPK53I2Xx+zvwEHoaQLZEtyjngbV9Q9JzFC6Ye2OHptOuunhIOKrnmuu4FXvVZwvXetLy7/0vE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(6029001)(4636009)(346002)(39860400002)(376002)(136003)(396003)(366004)(55016002)(9686003)(71200400001)(38100700002)(2906002)(33656002)(122000001)(66946007)(66556008)(66476007)(7696005)(76116006)(478600001)(54906003)(55236004)(4744005)(5660300002)(64756008)(26005)(8676002)(8936002)(86362001)(4326008)(316002)(6506007)(186003)(52536014)(110136005)(66446008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?E9YE9YHgPo6fBp3efOBvx9hEG3UhK/KSObDPQimIey9Xa3JUwOgS7iq5ELaD?=
 =?us-ascii?Q?686hn18F7jE5KHP6m0vKJvllIvcynld+yuGmHvvbMCd30vHVF+4JdMiXjg7L?=
 =?us-ascii?Q?WBlte1W7tYG3OBGL8kGbb+7R4G4XFGaI5zeNnz8y3PAzF3wYAdUgRci3+7as?=
 =?us-ascii?Q?L4xW5XGWpT4F9ZyIGbL+86zIvHz9M66yBL2kjpxDmkANubh8RiVsSVzgrOE9?=
 =?us-ascii?Q?UV+BnOxMfj5nCDCvXcmLOjzW0PXU+fFu9Lva7nrMVVTKYIGEZQ+UDRF35Bur?=
 =?us-ascii?Q?dEGNL6equu2iVG6jJs5HdExGt4Ib88cGm1vvHIcA7cbKXOo0zpIOofRXwDav?=
 =?us-ascii?Q?kDINKSF8xOs8n5ApnxFn2ABHGj58X98m79ycwy3817FspF0aRgVR+/G5gBgn?=
 =?us-ascii?Q?2FbcT2xUMapa/oGBcc4vQPeLxH3FPuuhHIor5qyg5D4TwG703QwlZP+zKhxB?=
 =?us-ascii?Q?frWdopmDb4Tw7XsLwsGJ9GIHuDcKCKcp9Avq2ayT+9jGGEYaK47FsbWxePgk?=
 =?us-ascii?Q?Ak7L5tFUiN5fnEX+Si62nVD4kVrWqQgv9JQqvHDOJ8qSuAhlvgQ7oCoL9+fG?=
 =?us-ascii?Q?pX7CxYa1ajj2iDr2CcyuNQXTL6xCWj3yveCzKoGwOQH7hX5I1pP0+BaaRbKR?=
 =?us-ascii?Q?ykTQHCNga5gr69yTy3j9RrqM2Ho2EBZYhbD4HcWoz1SUrTCbha3s6LF6rSUn?=
 =?us-ascii?Q?V5kTldo3DSg5GqVXLKsiZgWQnBGm2kpN3v5jSp9FWvcgNz0d8MKYVC0/+srx?=
 =?us-ascii?Q?Bz/iuYrPTA44iqB79ewFbAI51mi7HtcDtx5PL4vU+jCDiPtSY6hkHuldrqAx?=
 =?us-ascii?Q?jhyHiXbpP4oRp0Uwa8wDpifVI8qBl3xy3xrQn3ALQViq0Xh8I/4QImoRY41b?=
 =?us-ascii?Q?nLZZ/DCGq6cywYZHB/nLIj0g9W9sYYlcYP6YN8CEBc4jU41mqe16bnILMezL?=
 =?us-ascii?Q?sNejuhaZfcD4y/tyVBSOBG+gFMVPOgzu8gedy1IVRlURT0+K7EYtx7dLaOW8?=
 =?us-ascii?Q?esEe8RdSugqoG+sm7lGmN5dw5fl/+qwbL4+aufkw7xJgHHHBGt/yayTGZ9Jw?=
 =?us-ascii?Q?QStKvHcB3QLReE28frq9eyD/DFPx7O9dLBIetuYnH3K+9+Bv8s6LC74BCc+n?=
 =?us-ascii?Q?2nE4hCb95Tq3T3717qgjms6CHSu7MIJrXiPqK3CGhgOPXT5yj4iSi3kdbXek?=
 =?us-ascii?Q?hZrHGIsvVonlIWaYNdheK9P+u0ts4lpPvFox+PoZ5smBHRDNvNieKdVFZIc9?=
 =?us-ascii?Q?hjBIbCVm1txHImTy32OBC3IL2QgYFVUMkfve6L7FQKzgAPdt+e9PgtIjbrwn?=
 =?us-ascii?Q?201MKdt1xfG73LdnpkeYlIEO?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfffdde8-80b4-40ab-bb50-08d9362dd349
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2021 10:01:09.3520
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aGtHKX3/YA3HVmGqjSPstJBW8hYJ8jk/f1vh2pOqtELNOXpQhntSWCfiE7DthQ+zkqPTa2qctay8UW9oXezhzVOcJMS+ZjDac41FgMOu6c/YQUyFwFo9XEug8vEiNKDL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6429
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert-san,

> From: Geert Uytterhoeven, Sent: Thursday, June 10, 2021 6:37 PM
>=20
> Document the compatible values for the R-Car H3e-2G (R8A779M1) and
> M3e-2G (R8A779M3) SoCs.  These are different gradings of the R-Car H3
> ES3.0 (R8A77951) and M3-W+ (R8A77961) SoCs.
>=20
> All R-Car Gen3e on-SoC devices are identical to the devices on the
> corresponding R-Car Gen3 SoCs, and thus just use the compatible values
> for the latter.  The root compatible properties do gain an additional
> value, to sort out integration issues if they ever arise.
>=20
> Document the use of these SoCs on the Salvator-XS and ULCB (with and
> without Kingfisher) development boards.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

