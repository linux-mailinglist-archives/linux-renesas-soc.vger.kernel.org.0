Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B64D54B268
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jun 2019 08:51:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731065AbfFSGvo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Jun 2019 02:51:44 -0400
Received: from mail-eopbgr1400113.outbound.protection.outlook.com ([40.107.140.113]:49376
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725901AbfFSGvo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Jun 2019 02:51:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jS+Q8Yv0a3S+SRjPcINbtBLJ1lMrMsARexDnT8CCaGU=;
 b=IWLdLts1eDUsjECT9y0qIXQ1SSUx07N2/DiN/sk9UGc3TdGrlOaPb8IA0ajkFtu7eOo5OrM94rkQxw2HJcgi2WfHrQFhN3ZsCy7b0Rgx0C6uPYKTq8rnPEpCSbn1kHAhujEnu9WsXN96bqodYidLExEFePYDcQAMZTa5W1NQxe8=
Received: from OSBPR01MB3590.jpnprd01.prod.outlook.com (20.178.97.80) by
 OSBPR01MB4102.jpnprd01.prod.outlook.com (20.178.96.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.12; Wed, 19 Jun 2019 06:51:41 +0000
Received: from OSBPR01MB3590.jpnprd01.prod.outlook.com
 ([fe80::b1c2:125c:440d:e240]) by OSBPR01MB3590.jpnprd01.prod.outlook.com
 ([fe80::b1c2:125c:440d:e240%4]) with mapi id 15.20.1987.014; Wed, 19 Jun 2019
 06:51:41 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Simon Horman <horms+renesas@verge.net.au>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        =?iso-8859-1?Q?Niklas_S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: RE: [PATCH 1/2] dt-bindings: usb: renesas_usbhs: Rename bindings
 documentation file
Thread-Topic: [PATCH 1/2] dt-bindings: usb: renesas_usbhs: Rename bindings
 documentation file
Thread-Index: AQHVJOvyRe/kAhIeiUCCe5PspYP6bqaijK1w
Date:   Wed, 19 Jun 2019 06:51:40 +0000
Message-ID: <OSBPR01MB359075318C45C2CB2B7E3485D8E50@OSBPR01MB3590.jpnprd01.prod.outlook.com>
References: <20190617090603.8449-1-horms+renesas@verge.net.au>
 <20190617090603.8449-2-horms+renesas@verge.net.au>
In-Reply-To: <20190617090603.8449-2-horms+renesas@verge.net.au>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4da38630-89b3-4034-245c-08d6f4829590
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB4102;
x-ms-traffictypediagnostic: OSBPR01MB4102:
x-microsoft-antispam-prvs: <OSBPR01MB4102B6276A63694926769877D8E50@OSBPR01MB4102.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0073BFEF03
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(396003)(39860400002)(366004)(136003)(346002)(189003)(199004)(256004)(6246003)(81156014)(74316002)(66066001)(66946007)(110136005)(316002)(8676002)(8936002)(53936002)(102836004)(26005)(305945005)(6506007)(99286004)(4744005)(6436002)(9686003)(54906003)(7736002)(55016002)(33656002)(2906002)(68736007)(73956011)(76176011)(7696005)(66446008)(6116002)(14454004)(66556008)(3846002)(25786009)(81166006)(64756008)(71200400001)(76116006)(229853002)(86362001)(446003)(476003)(4326008)(11346002)(71190400001)(186003)(5660300002)(486006)(52536014)(66476007)(478600001);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB4102;H:OSBPR01MB3590.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: PTl0iIG532gCk0BDthF9ysOOZ3nAqNgI7Z/eYioIYj0PKwIRCZQuwwYWB4v/M0NdFN0BLDrwwQh4zr/nHsa4anMvZ0a/ljyulvFrtN/tBq/ruKADD5FFOlLigO3IAVG5NRJzQ/0BozFsIVBj09YALLMKdrRQ7EaSVtnG7vH5G+IsNim4dYhm0TeNxD6Z9R1bX/sFwoNydi5j6q8FvFPy2Ziq2498Kn2yLyY/HhTaK0kro/OVxItMZtzgES5lmQgzoxKnoDjRw/NiqxksZkF1RrbEpL8TRI1h4crvlWzyQ3R7rZxlbb4UHC0RejZVzxPsmV4RjeLu9GjCmQgfqauUITdwT0oAcvsBexMnoQR/GN1BUz4h15x67fFJ7EWy6hxvqwQP+SoE9eK5rHrye8Znn+JmVAkrAXk9ztqiHcsuuL8=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4da38630-89b3-4034-245c-08d6f4829590
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2019 06:51:40.9762
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yoshihiro.shimoda.uh@renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB4102
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Simon-san,

> From: Simon Horman, Sent: Monday, June 17, 2019 6:06 PM
>=20
> For consistency with the naming of (most) other documentation files for D=
T
> bindings for Renesas IP blocks rename the Renesas USBHS documentation fil=
e
> from renesas-usbhs.txt to renesas,usbhs.txt.
>=20
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

