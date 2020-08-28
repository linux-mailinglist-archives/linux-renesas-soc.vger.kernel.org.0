Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27DB12553CF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Aug 2020 06:32:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726386AbgH1EcB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 28 Aug 2020 00:32:01 -0400
Received: from mail-eopbgr1410107.outbound.protection.outlook.com ([40.107.141.107]:60288
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725969AbgH1EcB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Aug 2020 00:32:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fwUr1m1ZQaEo56A6Mbj9gexaJD9aNeIWaNTedX5FP5qzWh+R4GWDW3H6T7ND4TH9jhBbkmdcUXHGXins6U+igJwcLKDAE6EGu5jqGxesqc6rDoWS+vvzc46T5CoPo9W+jmoqGW17fd+3497ZRjn3gw191nQieSXCrT3xnOuFaR8HIN/to+o1r8+e+h/zxN+3vfafVOzSJYu87RT71nsV8BBg4IXtHjVpLNlxvUqgH5R0DWsb1YuWG+0tjQznpKRo0ppzefzUuFYoU5sPymgcN3AiWk3QoENSaQAFQahRoKH8vE15KsxDwnSFmp7Rm74JbTjNhCp1acdIU23caFRbhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jrk4KViV8R6xkKu369fsQ/28INZxzD7yGZXxfH/Ot98=;
 b=VTBxXbHdJGnAe2aW+rT05SeQGXxEnlVE7D1m1fepcL7WOK8PMRb9EOfZrhtnPuvlFi3QiHId7XUPeY8sWg2EYsIr0ImkdEQF0XNfitGsh30q53D1boF7EqsBQsj/6aJkxE9M+S7jhTTP0RVdfH+SV0DYA13zCvJrZondT9Mf97Yo4G8EfjpcNsELu956WxE/KtV3OaLxD/nLDIkvGqRRTkCF8mB4hmGkDeLMFgf4y+yRqRzjtsBgdVNpAE/ro8+u1qoHb4v/Rn4M3VZbxwc+B6vUJ4t9ELJOqwP+M+syh7IiryNNRavMpWel+C3SEBK/N5yVkU4MdAHzzepiAJ8nTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jrk4KViV8R6xkKu369fsQ/28INZxzD7yGZXxfH/Ot98=;
 b=l/GC6kRnEHyi7G4mbd+mkBIpG852EqdONnbVKxDWnsmjd6a0YEc5Ngl1OMFLFpwCCW8j0oVU3qkYXnmZ8zrRkm65O6aXFFgG1jOoYTmj8C3R2OlADukhebcIMyXMeSnPt0iSChDFbgxboG/vs1IoLCfn6lQv93kDilqRKWRcp38=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYAPR01MB4541.jpnprd01.prod.outlook.com (2603:1096:404:123::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Fri, 28 Aug
 2020 04:31:58 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9083:6001:8090:9f3]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9083:6001:8090:9f3%6]) with mapi id 15.20.3305.032; Fri, 28 Aug 2020
 04:31:58 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        =?iso-8859-1?Q?Niklas_S=F6derlund?= <niklas.soderlund@ragnatech.se>,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: RE: [RFT 6/6] mmc: tmio: remove indirection of 'execute_tuning'
 callback
Thread-Topic: [RFT 6/6] mmc: tmio: remove indirection of 'execute_tuning'
 callback
Thread-Index: AQHWdvVxLVzU2PEmwECfRg2jqzfCvqlM+YWA
Date:   Fri, 28 Aug 2020 04:31:58 +0000
Message-ID: <TY2PR01MB3692CF611A520A4FF409E4A5D8520@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20200820132538.24758-1-wsa+renesas@sang-engineering.com>
 <20200820132538.24758-7-wsa+renesas@sang-engineering.com>
In-Reply-To: <20200820132538.24758-7-wsa+renesas@sang-engineering.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: sang-engineering.com; dkim=none (message not signed)
 header.d=none;sang-engineering.com; dmarc=none action=none
 header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:b16e:b7b1:d350:3c9a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9de9ee1d-dfe5-4842-5a2f-08d84b0b4d2d
x-ms-traffictypediagnostic: TYAPR01MB4541:
x-microsoft-antispam-prvs: <TYAPR01MB454188AF5808B28E0F146304D8520@TYAPR01MB4541.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MjrYxBk+VU6XPOpKWMZSGb/gd03ymJhixs1duprGnLLF6drJz8HuADOCrdn+vbxscJ9GK397d2abWyk9/Po8t6U1NjaAJeUpLBsjQnA6MvbYz01PkgiPUSHZa+nTzs61AjWxV3ndBw2HkHI1yyKaRHzaj08ssndrphi/+XBRvZ0Yh6OuK02lfw0Prv9ZdmKhC56hlrvNrpWdZwvHFXPJhq6k29a9YG/EfwzIxIwKtik2hKZrUU9eeeFfpFdXPDhOXkcXi4W8ntaks/QandDmMwR7ROMNzphsMQQLSeEOK09pQJDjG8woAIzf3gzltCROEH4KuctcmDX32oiKX0XbbA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(366004)(376002)(346002)(396003)(7696005)(54906003)(110136005)(55016002)(4326008)(71200400001)(186003)(52536014)(2906002)(33656002)(5660300002)(86362001)(4744005)(9686003)(478600001)(6506007)(64756008)(66446008)(8676002)(66476007)(66946007)(316002)(66556008)(76116006)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: qrBOesGqD8ftEVzkO2CSizOWfSCErMyXlKUuW8ZQkiOVCrkCPAd6w2OUzUQtuPY+qxbBEHQEhqiZ+kKelmq2eDwzvrkdygBuF4L8KpEa95lhBgpZmfZLm6INFGqiT+6Q00zlJEEV3jb/F9tUhx7o/7aY5EnOu/z0p+VbrUbX9nYzCHkDVsC4nhwVVRH7zRxV4AJUG5iVeNDd/uPlt+1Zu4Qfqm4DkFv7yRowQizHnfGZUBNuLaRFRM4teXzoSGvCyuFE6zhur/lDsR6UEdVdk6xPVfxTNQ8D9JaPYjpISgcpcytro7uH8hDsU453Uf85NNYy8uMz2+J6pTZID89iNLKiffwbaOYwJqwsn5f/ld0h9Nt7tVO7HqPZOuLG8snVufHFGhyVJf5vXha9jxhYcrFhCO0eRBIez3tyd4gyLmsXigk0BL7QcQCQrFeNclISY1r+piqDLI9YCRDcPiA1nhLN8+Hx1tbCAS31o1O2so3+Ek7IYWQAuMf5fMKjKU1hLWXWkC7KUOJZaNjN4sPegQbu7GsnJqJKXCcr4/yoU2uhI0pC110aKfIFms4uT02SFCazwHY5Gmlhp0RGeAGpkrlY+idB1NbHN3g3mbru5KK8xhIBQbhK38yg+5vAMSZ1VVdUqO70pGhg6uBmnQW7kYjqhOqSJFkt+NCezbROqOPJxULbrjAy5XbsUYS5XIiVp3yHVGBbd8NVffOGOV2AyQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9de9ee1d-dfe5-4842-5a2f-08d84b0b4d2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2020 04:31:58.3147
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ql0Pha2isWWKAEXHY7bwMKGISY+331MYKZC1tAxjuiqi0MVlAjU+ANiPC6iLTTAn91DpTqEeBN9VCcq4SF66/fG548tODfwretHJku/qv/kOdngsvHC9sU6+NUKg9dEV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4541
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

> From: Wolfram Sang, Sent: Thursday, August 20, 2020 10:26 PM
>=20
> After all the previous refactorization, we can now populate mmc_ops
> directly and don't need a layer inbetween. The NULL-pointer check and
> the error printout are already done by the MMC core.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

And, I tested on R-Car H3 ES3.0 Salvator-XS and it doesn't seem
any regression. So,

Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

