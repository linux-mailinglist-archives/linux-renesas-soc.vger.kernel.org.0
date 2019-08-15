Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC4F18EE47
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Aug 2019 16:33:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732976AbfHOOdC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Aug 2019 10:33:02 -0400
Received: from mail-eopbgr1410121.outbound.protection.outlook.com ([40.107.141.121]:42603
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730930AbfHOOdB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Aug 2019 10:33:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TAWOlnT/7qC+lgpVCT+MUG03P7bwjwZDnDdQyYtX6As77SAR0EiE3ip8f1Ju2es0ORPmVHt/a0DRUXJWhsXs/H25m1u61kYTDNJSeA0nc3f2i55hzVb5IH8zDB3VmNwGKvrlgVRrEpMm6ANLGN90FrpHg8TTqIiB+GApyPSUlaB6kBkBEbbrdMrh9oO0eLIdHOTA9aWAMvbuqOGoB5GvXxjo7DgPa8KHOjKg0IXVcuMZug6UNsBmKa1AjQZs5DwhJZxl9+ItPqkxNhlugv308Sh54TOht8Adm+dgvAuCYhp/wI4ozhB/VUu9pAl9PA73XJxPObjTz+X1i3uv1TutGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZQJ4nhZJ+GUsczZ/Dg4hOcDkXlYjWEc4Y/CgTuy/GME=;
 b=cN6FPkEERZklbyz40wdy5+GKnZ82v1V91cMaQhuIOr9vP17UGE3bSb0we3C7O43KZxK75smBzql6zxg6jo9IKkELWn9/AC/4jHaI3XiSubPJyA3kUoJ8oOvJNKX0DgWSyOp3UpM40Ma3NRghd7I8d2e5BeZEe1LpXGhKvumkHZBLwa2ZHUb3qOFq0O86WiiIaT10xanRklmkZNBu6Ipc8nnwjE4G3NUbwS80SJYEp4z+5RXGwr09zHdhBwpt5OL53LHRZbWRWD8yh6H1mzyt5SNZag53UtwearRaxJKrKyRIkbyNeuTKGzEpf3KwEUU9kXQSLy7DA8AeSFYVDtZIPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZQJ4nhZJ+GUsczZ/Dg4hOcDkXlYjWEc4Y/CgTuy/GME=;
 b=i9FMzTDJcaqtQ6twQiiJXaGc4FPs0cZpmQQSVUKqycbjtx/Qh+UwwmsOyUNK7HCQ7p3zHlQNEgyUc7HfrJ/nVdf1tZI/b87qL/r2KZnio0VDzTdF1nFOko8IRdQvMehUafrLFfrGTo6TCsut266CsYjF01bBPfpn4QLZsUcRyOk=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1482.jpnprd01.prod.outlook.com (52.133.163.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.18; Thu, 15 Aug 2019 14:32:58 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::d881:cb74:8277:5a16]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::d881:cb74:8277:5a16%7]) with mapi id 15.20.2157.022; Thu, 15 Aug 2019
 14:32:58 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Sam Ravnborg <sam@ravnborg.org>
CC:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>, Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Eric Anholt <eric@anholt.net>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        "xu_shunji@hoperun.com" <xu_shunji@hoperun.com>,
        "ebiharaml@si-linux.co.jp" <ebiharaml@si-linux.co.jp>
Subject: RE: [PATCH v2 0/9] Add dual-LVDS panel support to EK874
Thread-Topic: [PATCH v2 0/9] Add dual-LVDS panel support to EK874
Thread-Index: AQHVU1lCzWPU8rN+20OeSTkBlzlJDqb8QTmAgAAEdbA=
Date:   Thu, 15 Aug 2019 14:32:57 +0000
Message-ID: <TY1PR01MB17704B86A76BB8A0762570E2C0AC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1565867073-24746-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <20190815141559.GB2437@ravnborg.org>
In-Reply-To: <20190815141559.GB2437@ravnborg.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4ae527f3-bc51-4e21-a7c4-08d7218d77e7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:TY1PR01MB1482;
x-ms-traffictypediagnostic: TY1PR01MB1482:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY1PR01MB14823520DB647516F602C332C0AC0@TY1PR01MB1482.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01304918F3
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(396003)(376002)(136003)(39860400002)(366004)(346002)(189003)(199004)(66946007)(305945005)(64756008)(52536014)(446003)(74316002)(25786009)(6116002)(2906002)(256004)(14444005)(66066001)(7736002)(186003)(478600001)(476003)(6246003)(229853002)(76116006)(53936002)(44832011)(3846002)(66476007)(66556008)(66446008)(6436002)(76176011)(26005)(966005)(71190400001)(6916009)(55016002)(8676002)(86362001)(5660300002)(316002)(8936002)(6306002)(102836004)(11346002)(486006)(6506007)(81156014)(9686003)(99286004)(54906003)(4326008)(53546011)(33656002)(81166006)(7416002)(14454004)(7696005)(71200400001);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1482;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: uT95COjexG7arA5j1AppjzOihbOxDacBxwO3GL2fU8IRggFIc6x+tS5Ta/YW5HETtEvxaPJPvRKJ9S29hlfcClwpi6uJHK/hPQShYrRtxfqgZVEyfd7jNp2pcnBRO6FiFMML7GzkGoUy/A1GIXUS7RRfKfNanv7TcRpeIYsE7e9bOfanV52hFD23a9iRggkqzdr1LdNBvvRv6r9z5Q4cUUXTDV0BAkp2Uk8GJlQzmv62TSvNaDdeiP0GTX2NoTjxLOHC7XWr+SxhYo6WNQpjBYHFOoMeDwlnRhtsS8ytDPK5Al1TzJX0uFpIV3aZaYfoIx7vsH5lyhaCED8aLmLWjtSyy7kdoIluqZVZZyLq0N/V1LXHJx7q1AaIPczGzwE/mHMKm+abUouiANvVezjtv4sV8zbhvMBqFpixm0WBolY=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ae527f3-bc51-4e21-a7c4-08d7218d77e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2019 14:32:57.9381
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S/LWXf/R6aHysZWIbdgI7jq8oU7SnXCSG9IZgkcKzOBnY0LjhCQPJpIPt2qBLpOl16dI9mE52m+t+evQcEjsy1zxUc63zHJlQqXB6dotlzI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1482
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Sam,

Thank you for your feedback!

> From: Sam Ravnborg <sam@ravnborg.org>
> Sent: 15 August 2019 15:16
> Subject: Re: [PATCH v2 0/9] Add dual-LVDS panel support to EK874
>=20
> Hi Fabrizio
>=20
> > it appears that Rob has been busy converting the dt-bindings relevant t=
o this
> > series, and his changes are now found in linux-next. Most notably
> > Documentation/devicetree/bindings/display/panel/panel-lvds.txt has now =
become
> > Documentation/devicetree/bindings/display/panel/lvds.yaml
> >
> > You have already taken patch:
> > https://patchwork.kernel.org/patch/11072749/
> >
> > as such the patch I am sending you is still related to:
> > Documentation/devicetree/bindings/display/panel/panel-lvds.txt
> >
> > Patch "dt-bindings: display: Add bindings for Advantech IDK-2121WR" is =
still
> > assuming the format is .txt, as I am not too sure about what the protoc=
ol is in
> > this case? Shall we take this patch and convert it later to .yaml or sh=
all I
> > convert it to .yaml straight away?
> >
> > Please, let me know what's the best course of action.
>=20
> It is preferred that all new display and panel bindings uses the new
> meta-schema format.
> And that the writers uses the available tools to verify the bindings
> submission.
> This is one way to avoid simple mistakes in examples.

Will give the meta-schema format a shot.

Thanks,
Fab

>=20
> 	Sam
