Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ABA2619359A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2020 03:12:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727560AbgCZCMI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 25 Mar 2020 22:12:08 -0400
Received: from mail-eopbgr1410091.outbound.protection.outlook.com ([40.107.141.91]:23235
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727540AbgCZCMI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Mar 2020 22:12:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nhbvsVRDw5BXekzIDGujl9takpmJCXxodt/3wFLXZPZGlddEx2sEh6DvwlvRX1FK7z0gNUd27D4cC4g98AehMMODCaIFVse80orBLUXTv3+fPbHSCPQCyH1nbwoGPf2UoigTpr8hc652xqwBJ/3j/UaCX4Z+6WctZ5Lwandqw9yrdzoythLbWpede4Yw+sHoP6hxpDAg3Wq9CK7feyREIMPO/KuHwaGJJNLo9EMnHLlFkAqvY2XUm2LH9+STviokZkCYHC8PUggw0E0hbVSwE+sbZDb3XUvWpdQwicKFY8UpFVNY1fMnCv5gdce4Z2ws2PPUx55N+Jl8s5tq+W+Qmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iU35lCt4GfdcNMkNfZPCZEcNwqG3e8UnviwzMj16p2s=;
 b=JjA/ngM1A7CMvCIoQOlx7GC111RpcE02JKtEbs+4cQn3+VDeLL34/jSfVR8B3qFpXjTChwQ0vnQmfHwBqUyYAeWYiK+yMbryMSwOyDHlmYtNYJHqzTpDa6JBefeyzt5huvvY/CQdhqVVA1sHm5fPom5P06sxMe2iC6783I0YtGsqMIfbiphQ8CWO0dqeo5LidgVvXCDawiascrId66qgDq6arDIgGNhyYXxCLgaFVNSCA7FK33hvjNqVB3836QagpuuATH2hG1OvAuDbNZ1MmNy+YZou+rlzDmsj8vkfDKKM0OD+2yy5W/FdPYfc77oKUhJ7kDpgkzvp1qhy1MCVJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iU35lCt4GfdcNMkNfZPCZEcNwqG3e8UnviwzMj16p2s=;
 b=ISK3YER6GrdLdz9jhQcREolvEhq7CuDT79UE1fo8PLXR4QjWVRuEdlRTqMOuSm1oX7HMgRJGTm7+F2uTpG4M+rMFTAyljCE6vcF6yexoQSdNE1D+Jhdm/lowVd8RZ+zDwPdMH5UG7958jnu3KqokeM8DWxEbOMiXxqqtMfhuXus=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB5021.jpnprd01.prod.outlook.com (20.179.174.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.22; Thu, 26 Mar 2020 02:11:58 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::ed7f:1268:55a9:fc06]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::ed7f:1268:55a9:fc06%4]) with mapi id 15.20.2835.023; Thu, 26 Mar 2020
 02:11:58 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Greg KH <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 1/3] dt-bindings: usb: usb-xhci: add r8a77961 support
Thread-Topic: [PATCH 1/3] dt-bindings: usb: usb-xhci: add r8a77961 support
Thread-Index: AQHWAm0GCc3h+4VRrEGpfEWVhd+vS6hZRSOAgADdcoA=
Date:   Thu, 26 Mar 2020 02:11:58 +0000
Message-ID: <TYAPR01MB4544E5905AE051D7DF29F75FD8CF0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <1585117006-8266-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1585117006-8266-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdXxbzR=boveEoynjFwV8=KSkOzCTdQVmtN4Hh6PVMj-Bg@mail.gmail.com>
In-Reply-To: <CAMuHMdXxbzR=boveEoynjFwV8=KSkOzCTdQVmtN4Hh6PVMj-Bg@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7b5fd7a7-0ea4-4ea7-598c-08d7d12b108c
x-ms-traffictypediagnostic: TYAPR01MB5021:
x-microsoft-antispam-prvs: <TYAPR01MB502186213DACCB884EFEEFEAD8CF0@TYAPR01MB5021.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1332;
x-forefront-prvs: 0354B4BED2
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(366004)(39860400002)(396003)(346002)(376002)(136003)(86362001)(66946007)(33656002)(2906002)(7696005)(76116006)(66476007)(8676002)(64756008)(66446008)(52536014)(4744005)(54906003)(66556008)(5660300002)(8936002)(81166006)(4326008)(55016002)(186003)(9686003)(81156014)(55236004)(6916009)(316002)(71200400001)(26005)(6506007)(478600001);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB5021;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yxpESVqcQwewAZnE41qz+edrZ2HnIktc6LMw0JJE5kSm2CCDpVf1uB6yGbCpRPNNy2q8JOSkW6qS/sLLtpqo1+hA905THoyB1c1tUoAFlOyJk7wnds62woT61S3J4shdkQ8bKpilhVazPH47V4LrHSiGGia9DL4HjCBnW4PuOMuau5aXCwBnhpQpm3tnMUlLacLGbjqhcKLm0aONR24KKuyCt9F0sFiq3+QibuxD9RhyjWKa95MDFsqwfnlRwpn/OlJCI8UpcW0LK2IEDN6D8dJldVAiG7eOfP6NFGpjP/OjnHB8nwCupbOsaFqMwx7oL1Km2arfPd6hgAuZ99UGbmhKGnqlgpiFXlR/nOrEEm/f1u9MEv3WW3eR7fLuv/9yHoV+Z2wHPdTEgEHMYiKRahO64vfDrlAtWIuPzHWJl18ZLO/Iqpzr3eJX0UMrcqJJ
x-ms-exchange-antispam-messagedata: TaLMnx9+xtqSOpD2Rk1kRXwKVuj9My6Fp7J30ki2ripj69Jo+N0Fg9EgmwgkfW7vzsueuij3RaAJ5GfgyAOLx+UlubPWe3J5HBWXFRZiiMKy5N5hf4WPyO6X72gF0JgOpt1JUPiB7+O5WUlVcivF5g==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b5fd7a7-0ea4-4ea7-598c-08d7d12b108c
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2020 02:11:58.6517
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t+rvCYrI3EQ970es/ng1mnDVyN/pFOZMgJo1i2soCc0uyBRFPt2cnNYXMMWsEK/47Ckz02dAaddFVrfcGy2NA8DsmakX2FzXNGsDvXnFjP15jF1i2P9j/dOXK9+Jto8l
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5021
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3IQ0KDQo+IEZyb206IEdl
ZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogV2VkbmVzZGF5LCBNYXJjaCAyNSwgMjAyMCA5OjU4IFBN
DQo8c25pcD4NCj4gSGkgU2hpbW9kYS1zYW4sDQo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3VzYi91c2IteGhjaS50eHQNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvdXNiL3VzYi14aGNpLnR4dA0KPiA+IEBAIC0xNyw2ICsxNyw3
IEBAIFJlcXVpcmVkIHByb3BlcnRpZXM6DQo+ID4gICAgICAtICJyZW5lc2FzLHhoY2ktcjhhNzc5
MyIgZm9yIHI4YTc3OTMgU29DDQo+ID4gICAgICAtICJyZW5lc2FzLHhoY2ktcjhhNzc5NSIgZm9y
IHI4YTc3OTUgU29DDQo+ID4gICAgICAtICJyZW5lc2FzLHhoY2ktcjhhNzc5NiIgZm9yIHI4YTc3
OTYgU29DDQo+IA0KPiBXaGlsZSBhdCBpdCwgeW91IG1heSB3YW50IHRvIHVwZGF0ZSAicjhhNzc5
NiBTb0MiIHRvICJyOGE3Nzk2MCBTb0MiLCB0bw0KPiBhdm9pZCBjb25mdXNpb24gYmV0d2VlbiBS
LUNhciBNMy1XIChSOEE3Nzk2MCkgYW5kIE0zLVcrIChSOEE3Nzk2MSkuDQoNCkkgZ290IGl0LiBJ
J2xsIGZpeCBpdCBhbmQgYWRkIHN1Y2ggYSBkZXNjcmlwdGlvbiB0byB0aGUgY29tbWl0IGxvZy4N
Cg0KPiA+ICsgICAgLSAicmVuZXNhcyx4aGNpLXI4YTc3OTYxIiBmb3IgcjhhNzc5NjEgU29DDQo+
ID4gICAgICAtICJyZW5lc2FzLHhoY2ktcjhhNzc5NjUiIGZvciByOGE3Nzk2NSBTb0MNCj4gPiAg
ICAgIC0gInJlbmVzYXMseGhjaS1yOGE3Nzk5MCIgZm9yIHI4YTc3OTkwIFNvQw0KPiA+ICAgICAg
LSAicmVuZXNhcyxyY2FyLWdlbjIteGhjaSIgZm9yIGEgZ2VuZXJpYyBSLUNhciBHZW4yIG9yIFJa
L0cxIGNvbXBhdGlibGUNCj4gDQo+IFdpdGggdGhhdCBmaXhlZDoNCj4gUmV2aWV3ZWQtYnk6IEdl
ZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+DQoNClRoYW5rcyENCg0K
QmVzdCByZWdhcmRzLA0KWW9zaGloaXJvIFNoaW1vZGENCg0K
