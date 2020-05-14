Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 546CA1D2B5A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2020 11:26:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725935AbgENJ0H (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 14 May 2020 05:26:07 -0400
Received: from mail-eopbgr1320117.outbound.protection.outlook.com ([40.107.132.117]:40736
        "EHLO APC01-PU1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725925AbgENJ0H (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 May 2020 05:26:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GDQ0j2RaKJO8ALzSLxxUex/pJav8P6cRURwQE1U4LJYzFVq0xIwKUpC5EPso9LVzXX4DVGZk/EnQEKA9tzzghKei1ITKCJRzA2J+NGWMbrkvNF2G6uQnYbvI4g456Njej1hbGZ0O+qwSNsVPJVAGbE5VriO6EfPovB8XcpXWFMoBsFZHKf3E99nZAxQSeZIVR7Xftg7O0VRPz1La8WS6CNIkRNvkbw0S4gs3ZOcYaowmlHbDuKPp+insBRduvlGd4yDQx6Pd8r/js48Lc1ZotxVJqMcveidckOUlQN5zOCg76MAvwz1xNuJeh5rZjoipjqKyBtobO7WmxRVoLcS7GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f5UK9U7SOMoFr4iWmgj0oEqEN2BXL1t6Fpdan7xgf14=;
 b=hRo5l3inRXXyJ5/q1+bUDOK6mEROaJgwtpCSttqwvI4gSiWVYjstuHAYy0Bb8Uy48hj8ZpIYqpri2A7wCy3fJsF8KGFUSvSxYRwOc6ORZgkjrl7Urr6uad+NEw5seyNUUWQhkEOH8dUGe2dgy8JbQOl4g4nS5YGqwYUfUZzC5UI4rxru25wDMbYBxylDp3nRm1YE1aX9e3bMvCO4Ws4MJ3e7h5qbKtaB3m9thkg1o95GjcBw57GjB25JRKuP0rwUoyllPLPGS2cW2nccLCPgBAmQmi+GYyPwsxiYP7ejfXHI6eJ9Yn1RVjJP/NadQvs6iMN/qFgr0YuKTF+jZ8Ka+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f5UK9U7SOMoFr4iWmgj0oEqEN2BXL1t6Fpdan7xgf14=;
 b=eO0qn++f5GFQkFvGC3nsPLM1l7BQrVWy95E9rqNZruINjACkuSWYiOyfI8jbBHC1cOqAldXeNvIjF5sqx+OfJJn3xZ9/jbLSMM7o9yI+mvRQUBxHy2EO/jc/8y0PAoxAXPIIqI23MiPEATCaNOmzlqOzMUTvtcahlZTjJLa6ODU=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (20.178.142.214) by
 TY2PR01MB4570.jpnprd01.prod.outlook.com (20.179.171.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.33; Thu, 14 May 2020 09:26:02 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2da1:bdb7:9089:7f43]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2da1:bdb7:9089:7f43%3]) with mapi id 15.20.2979.033; Thu, 14 May 2020
 09:26:02 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     "kishon@ti.com" <kishon@ti.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v4 0/4] dt-bindings: phy: add r8a77961 support
Thread-Topic: [PATCH v4 0/4] dt-bindings: phy: add r8a77961 support
Thread-Index: AQHWBBrcd7y2rHbfv0+Yu2gHqJGbY6inmj+Q
Date:   Thu, 14 May 2020 09:26:02 +0000
Message-ID: <TY2PR01MB3692334705CC2191432F3178D8BC0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1585301636-24399-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1585301636-24399-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3e7b2f8f-d793-4c39-2121-08d7f7e8d218
x-ms-traffictypediagnostic: TY2PR01MB4570:
x-microsoft-antispam-prvs: <TY2PR01MB4570FF303E790AB647B94200D8BC0@TY2PR01MB4570.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 040359335D
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: W9MHKaZpEo8n0oN840pRWYYULQBG6Ge0reBV/RORZanVcckFln4ikqS1y4k0IkBMWbmaEWBU5N57czlk1x+QsT0hal0w+iH6b1M2P3vkujgv4g5rYmQqX7MukQI5ruEGvAChEX7TezVf50f7eYSOjsxHte4/e9gumev1Jz6RmQMfE+9lXj2BmVzO8cyBJ0UxYjxMW9s6MBq0r6Iohot149tKNMpai0aqy1eVq8W7//W8WqbtHXnKALhW3UzlZWtJeZ6KvmoV/4o2Y4E3fm7VuFZnPS+Cvn3PQrRLtwTqzzxfTAdZFfTvaLbkvO/yH40X7uvEun8OZVcahfi8iIZbgn1Pbiwd5m/AWtTd8BqqSTEhiDGU+lo8XKsNkFgPvSgoUNyZGDN2pEP+D+HQEumqnaYsyTvgcHNFhMTDlliaxUaMdiKp0Nzp3q9sN3HM17MTEOFy9IstEpJlnvZ2I/sHbKXFF7evThnCoFU1P5vPDGLivPtHWBbiVr0ix1FZTqhMP8TFpJyb2tVVVJPt1q7RwA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(396003)(346002)(376002)(366004)(39860400002)(76116006)(33656002)(478600001)(9686003)(4326008)(55236004)(186003)(26005)(52536014)(8676002)(7696005)(86362001)(8936002)(2906002)(66946007)(5660300002)(55016002)(966005)(110136005)(54906003)(66446008)(71200400001)(6506007)(316002)(66476007)(64756008)(66556008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: OEIeXwmA/KDfrgv6h8kBMlxaNi4b8ETo3dirdQpPoqBr39r2fY65HqB6jQ9yjO6H6uIDbpUjQy2dCk3IFHmxrn0swHtLR1uFI1AtTDmtRqvLcf6upFASWmmIN70FpuLDCGBG0DUBb7AtkwXWbZvpsDXExm2Lwd2dz0XZBJbjJflw7g9ENZp9Bcnj6XQy2aDf2nzFSELp2DKmcWx94yQLviKdWAUXNiUD0sBZLpkQa8+Q+B0KvPyYlxuVic1RJsI7CNsWieNGuJvvaYUGx5cpx3igWsOp25y6LFu+vkEtHBKR5lkPfUWTTAJAz3uRntGTC1/l6r12jA4GENW4m7TUD+9OIQYMvdP0v3Rrmjheb7a8iv95rUhGr3e9yvJ6Sn4qXg4sVVv9ICcIUF2D14PQyuWx+SAzjLoMSy82BNayc2xhyxq8xwwMlqVFtC1gm0dKFeUrOPJk+swI2liYM/RvSV8Y88ul8Ga1EZsSrIyBlu0Jzj27C3cYof1G8MHPGTrt
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e7b2f8f-d793-4c39-2121-08d7f7e8d218
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2020 09:26:02.4515
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TKNbRIlW1wzORC/WDH9oSvX/gXcWtYrWYeeMi0PAk6RuR32KPwiX8XoFrJP3AiZWVB0anuUf59sqlCDNs6pUZarqgv6uu/EQ4QFiT9OtU/3LeD7HGLEEcFForQShmbAY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB4570
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kishon,

> From: Yoshihiro Shimoda, Sent: Friday, March 27, 2020 6:34 PM
>=20
> This patch adds USBPHY 2.0/3.0 devices support for r8a77961
> (R-Car M3-W+).

Would you apply this patch series to your repository?
Or, should I resend?

JFYI:
https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=3D26263=
3

Best regards,
Yoshihiro Shimoda

> Changes from v3:
>  - Retain a description of #phy-cell in patch 1/4.
>  - Add Reviewed-by in patch 1/4 and 3/4.
>  https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=3D26=
2507
>=20
> Changes from v2:
>  - Modify json-schema files which Geert-san was pointed out.
>  https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=3D26=
1847
>=20
> Changes from v1:
>  - Rebase these patches on top of my patches of convert bindings to
>    json-schema.
>  - Add Reviewed-by.
>  https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=3D26=
1195
>=20
> Yoshihiro Shimoda (4):
>   dt-bindings: phy: renesas: usb2-phy: convert bindings to json-schema
>   dt-bindings: phy: renesas: usb2-phy: add r8a77961 support
>   dt-bindings: phy: renesas: usb3-phy: convert bindings to json-schema
>   dt-bindings: phy: renesas: usb3-phy: add r8a77961 support
>=20
>  .../devicetree/bindings/phy/rcar-gen3-phy-usb2.txt |  70 ------------
>  .../devicetree/bindings/phy/rcar-gen3-phy-usb3.txt |  52 ---------
>  .../devicetree/bindings/phy/renesas,usb2-phy.yaml  | 117 +++++++++++++++=
++++++
>  .../devicetree/bindings/phy/renesas,usb3-phy.yaml  |  79 ++++++++++++++
>  4 files changed, 196 insertions(+), 122 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/phy/rcar-gen3-phy-u=
sb2.txt
>  delete mode 100644 Documentation/devicetree/bindings/phy/rcar-gen3-phy-u=
sb3.txt
>  create mode 100644 Documentation/devicetree/bindings/phy/renesas,usb2-ph=
y.yaml
>  create mode 100644 Documentation/devicetree/bindings/phy/renesas,usb3-ph=
y.yaml
>=20
> --
> 2.7.4

