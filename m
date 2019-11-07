Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6328EF26A1
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Nov 2019 05:42:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733035AbfKGEma (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 6 Nov 2019 23:42:30 -0500
Received: from mail-eopbgr1410110.outbound.protection.outlook.com ([40.107.141.110]:6115
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726935AbfKGEm3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Nov 2019 23:42:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GfqNAfNCXAk1UpQPiqFdEAQzWmLTqxjvflRq6yjYx/8pl5+59DHy+MnsRiB3NBIEa667V791MALo/awD5CdCk7bI74+mvF9b6HEjL15dg/dkkr1JVkkCtKbdN5IwKoc6JZUFGcBf1NkY6+Nmo/yx/J4t3IqOcBlBk5gs7xEf0SlVaBVH5GFFwsaU2bSmJn24RAifA8fto7j/bpcuiQ4NOMr/Iiu+MkLP71dtRjkuVJVpHt7IdxKDV95LVbhD0qHh3xrILHjl4BM3juTBIKkjCNtGnS2E9MI6hZoXAmes1aJcQ3T2jbeSYLMORVZVdWEQGogd2KYX20MXZTZkKDQcmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2sjIUy1FJ/ZTCzuQq4tDF3ceiSuGiXW4JWG4ZAsF+Bw=;
 b=gQuOJWcmo/4wdWmlhG5g9QC2SdrMOs2AOCfIX8Wqyy3dhJEC78zpbZPzRGJAdxBZ66OCFlezFVaFD8ynX9OAVyMgQXGUB3vFWPM7CUzhtpYOtJzW2GVT6R/fqNk/SsnI37npVxgqGgN+fEpd9WA26o+KyGOyysuFtaEXUAcd5cd1LkV20ZzMywDgMcEaCq8GcaIu3LNBdGvv5HwdO/KeAvrVOBdC+pLtC5/EmwQfa3rbe7NyG/5gV8OPWxnMaim3qiMsIfvsOWnY1IKj5IobvNAc98qRDCrB2PEK59yCmz7k/RqZPM7HLkH84fIH7lir3n+72iONi8WKY1WoMiQYgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2sjIUy1FJ/ZTCzuQq4tDF3ceiSuGiXW4JWG4ZAsF+Bw=;
 b=ViO0Xn9OiVlxvZefuQnt4/4k+SUfVFX19nGDmVn+vw/02viX7Ylkiq+tPMsXBtKRYh6SgLYB4DhtRyVe0KKWxv12BCaV7su8bdVTSTrP5tt1u782zMQp1GrYaRVIsSThyA2yjjKwYsViGmnXY50iCIvljGhirEPRvOMtWkAIgYU=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB4255.jpnprd01.prod.outlook.com (20.178.140.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.20; Thu, 7 Nov 2019 04:42:26 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::6998:f6cf:8cf1:2528]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::6998:f6cf:8cf1:2528%5]) with mapi id 15.20.2430.020; Thu, 7 Nov 2019
 04:42:26 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Rob Herring <robh@kernel.org>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2] dt-bindings: usb: renesas_usbhs: convert bindings to
 json-schema
Thread-Topic: [PATCH v2] dt-bindings: usb: renesas_usbhs: convert bindings to
 json-schema
Thread-Index: AQHVlI3Pi+Kcq3guz0GqFGtj1OnqV6d+42kAgAA+qIA=
Date:   Thu, 7 Nov 2019 04:42:25 +0000
Message-ID: <TYAPR01MB45448C99FC96B7DD0C5CB0E0D8780@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <1573036483-16477-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20191107005700.GA26323@bogus>
In-Reply-To: <20191107005700.GA26323@bogus>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [150.249.235.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 35a5fd28-f566-4462-e3a8-08d7633ce380
x-ms-traffictypediagnostic: TYAPR01MB4255:
x-microsoft-antispam-prvs: <TYAPR01MB4255986688A9BBBA8F6B13E4D8780@TYAPR01MB4255.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-forefront-prvs: 0214EB3F68
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(396003)(39860400002)(366004)(136003)(376002)(346002)(199004)(189003)(71200400001)(33656002)(8936002)(11346002)(81166006)(486006)(4744005)(7696005)(6436002)(102836004)(305945005)(66066001)(6506007)(74316002)(478600001)(55016002)(26005)(76176011)(186003)(2906002)(52536014)(7736002)(5660300002)(4326008)(14454004)(9686003)(25786009)(6246003)(476003)(64756008)(66446008)(8676002)(66946007)(81156014)(86362001)(3846002)(6916009)(446003)(71190400001)(76116006)(256004)(66476007)(316002)(66556008)(6116002)(99286004)(229853002)(54906003);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB4255;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MFEAodzYnqe3aNbFM95Xsf/GD2QcYcZQeDvMb3Aoqx4pfCByg1nJ/8xK5/+ljPuZ+ZBvgBRcPE5zUgHJo15CjUXsCzZJOdaU9D4LeJgVCDl1DjC0+wHW6VurHkydvhNJicne9Mk1COhOpCC1B56UcV/7FUpRfJ9Pimep/Lw+QmqURY4R9Y8ZRMZpbA6dAG5RCfSKra3M8BBwVCAJh6qFYW9CHhnw7dSecQ9jAIe03JtGAKQDfWOo1nLaKk7a0lDaKe0a/Z9T2u4QpQkRKPYGg6bJDOjm6kbApfNo5xctvHOTt8dK5d8zOD7M/kxkz32VejW3x2Uiy0ChHUoJNijha81bDqnJCRt+mVXywkfkvNsPl534BFXC3UdztNjHVC2x8mwIZR9uBdgt1sb1SAnouMB/G/7lcJeLdqlVHW6D1VbgibjlxMyy2DsJHf00WCE1
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35a5fd28-f566-4462-e3a8-08d7633ce380
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2019 04:42:25.9898
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UF1wMhNw1C0RIJd+xNM7KRPthj1LmD4x93UJQBEex+VN0gOqYkFTtuVf/iZ1yZHqqMacmtFk6eOnCVFWavfFWJSpT1AlaPRfA8ow/JoO61DYje9iVlyIKH5cn6gXyEh6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4255
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Rob,

Thank you for your review!

> From: Rob Herring, Sent: Thursday, November 7, 2019 9:57 AM
<snip>
> > +  dma-names:
> > +    minItems: 2
> > +    maxItems: 4
> > +    items:
> > +      - enum: [ch0, ch1, ch2, ch3]
>=20
> This is saying the 1st item is one of the 4 values and the others are
> undefined. I think you want:
>=20
> items:
>   - const: ch0
>   - const: ch1
>   - const: ch2
>   - const: ch3

You're correct. So, I'll fix it.

> > +
> > +  dr_mode:
> > +    $ref: /schemas/types.yaml#/definitions/string
> > +    description: |
> > +      tells Dual-Role USB controllers that we want to work on a partic=
ular
> > +      mode. Valid arguments are "host", "peripheral" and "otg". In cas=
e this
> > +      attribute isn't passed via DT, USB DRD controllers should defaul=
t to OTG.
>=20
> Assume we have a common binding for this and all you need is:
>=20
> dr_mode: true

I got it. I'll fix it on v3.

Best regards,
Yoshihiro Shimoda

