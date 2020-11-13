Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22CCB2B1531
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Nov 2020 06:00:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726023AbgKMFAx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Nov 2020 00:00:53 -0500
Received: from mail-eopbgr1410114.outbound.protection.outlook.com ([40.107.141.114]:6118
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725866AbgKMFAx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Nov 2020 00:00:53 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NzER7OJzvK2eXegfG8ZhzHzgxKVTcShWNpiRmS2SiMRLLxSTJvtwjS5zYNFu89QYnhAZQqKr1uFihu3zXeot6cwXn7ybO4iXqdpSpI3hxYiA8MszDkJ2fPApawnn1ILC0WWDK8va+9IFxvcJbecCgx0/8t+8y2tDVaGN8bo1mh2i6P9L8pPMCepwcyiBbgZuyizYLdPhQS1RBeGrVItGnrWGUuB+jfXUfHnpNka7qj8Si8jRJ2ZOp44Tgh2kaRMwBCpM1TsqD9uXzqdzCrzVFLqcvsaSh5rfJ6iMIh0FzWziy1s8G7GghlK09ANFtxcFxDp5x34/pQ0O5a3n71LVcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xoWSTS7PiQll6+xLVIHUTJwxjqvIifCVvQGca2ydP20=;
 b=c8XKiore0CPTxIDGzT1kYX2LXRM0c6f5QC0Cqed08SozYo2Htv4prz77TYG/ERY8Vmpn8t2Ia+5c0mppXybkVmSa+Qy++QA0pKLwv+79J/uZRHFdsgpT+Y7IMRqjQOCOxwEPTBPaOCtsnb0HMSKEtKL92qGQ9XUBT2ojLYvxBD8nBSXoukXLBSBuvFirf51fd3sykGmgF/MtOl3w9ruOVbr56pMmtmA6oWGiJzg2j+RvaDakozS9drnRsqkBlpuUy8bCG1gNKkH8uNlHQRinbQkqkbnfyMrkDgXTMszFb2wxHQloKayakCy+ZLheQn440UXENbGKqWlUTbt3N3MZCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xoWSTS7PiQll6+xLVIHUTJwxjqvIifCVvQGca2ydP20=;
 b=YFrzWkFn5yxAcF6zTMyCkDSprzh4rwilsRPi3VFDhm0ypIASWTjllaTlpKC9gdK06aR90gVYY5lS7lYWW53TElfMMcFvoRYxxJeqfHWVMYNanXAEW024+qXAsfyaHrkhWr7hgK2kTiJjBAskvoFL7PSfzCAzF7t2nWgmWIO0aww=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYAPR01MB5611.jpnprd01.prod.outlook.com (2603:1096:404:8052::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Fri, 13 Nov
 2020 05:00:49 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::bcba:dccf:7d4c:c883]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::bcba:dccf:7d4c:c883%4]) with mapi id 15.20.3541.025; Fri, 13 Nov 2020
 05:00:49 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        =?iso-8859-1?Q?Niklas_S=F6derlund?= <niklas.soderlund@ragnatech.se>
Subject: RE: [RFC PATCH 0/4] mmc: renesas_sdhi: reset SCC only when available
Thread-Topic: [RFC PATCH 0/4] mmc: renesas_sdhi: reset SCC only when available
Thread-Index: AQHWt2y+Wb0D+La6zUKhP8OKfZr1f6nFf43g
Date:   Fri, 13 Nov 2020 05:00:49 +0000
Message-ID: <TY2PR01MB3692874CAB383A97074CF7F1D8E60@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20201110142058.36393-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20201110142058.36393-1-wsa+renesas@sang-engineering.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: sang-engineering.com; dkim=none (message not signed)
 header.d=none;sang-engineering.com; dmarc=none action=none
 header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:19d0:b06e:df1f:82b6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f0ac9679-5046-47bf-bc3e-08d8879116f1
x-ms-traffictypediagnostic: TYAPR01MB5611:
x-microsoft-antispam-prvs: <TYAPR01MB561199A8DA914990005BDD0FD8E60@TYAPR01MB5611.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tSqBlBoyzL6+xgAJTX0O6NyajARQ4gz2qyS1v9SLfJyBvdVQvB7x6E3e0TiK0vP/gjQBgc6ENTRkXlnCCrbW7hOzHzhSkwCDQPtZ8ryoW1SotMFt12Am0uxKWyckjy6jBK8qTcwwaRWOAo0A8kUnzy3QUzQVO65sM1LcHpnpB0rZnOB9jggn1YCG2VGbP5zqwyVJqCfjq/uBHo+lMvfY7bIvkwFtU2LWQAMcoiE09ngtrySvO4ALWzfZeDI4fqUwU18pmgHrnryJfg4Bl9Nz6n7UzEeof8SZhI4s6yQhEkjE7e7WRaelvu67XKrePJsx
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(366004)(39860400002)(346002)(66556008)(4326008)(7696005)(110136005)(186003)(5660300002)(86362001)(64756008)(66446008)(33656002)(66476007)(54906003)(76116006)(66946007)(52536014)(316002)(2906002)(9686003)(478600001)(6506007)(55016002)(8676002)(8936002)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 0pNq1nC+KcOESyA2mqV8X62uFEJiColSbP1n8rUsoR5Zb5bevrgu8bGJ4sXNi3uHrF6idw4lFrRXGGhmeDHA0Eu1IYPewSNPuNhSS0ulJSUMKQH79YWA6D10mq8yyfZBTaYx4CewHiDSw+37BGA2ggcmng24oBLOitb5Oe5uv3D/LljtXX9/QTuYQy4TFUKO2BQI0jiWrGcnAFBYEf+oXn9n4ivRxbCNjW/NACrGVBcSe7qZCBwogd4tOUWkA69BexDUuJi2FuogmxAA5bcNT4avzEG1/X8m1K+gwy7exPcfkG17bQSKLbxjdpvoPu/b1vdxfbai3YptByJhJBf5drEtEjyWliSO2aTqilifKEcyK4sDmXLbIx9zI0grR+L07HgCNXTJSz1b5U9rSgORtOVDkc5S2yuozXOOiYyCVo60d9pOIMTarc0pzmxhF4MAG74OBpbNV0nPO6b7KEIY5mF22CCGBe1zVYgwnTFxg2Fompp4WhZsQxqJpogLBg0lt9Cw9MhBmd3s6LbXcvpwgpBhYMWKZhDN5BxeO5uNZIVDKfBG6ypOBf1L4u7u8lTbHJ7jgtCYEpRgdK8YNY5AdwOZgbs2BG/kbpuDwgRTkM1ZFWOsJBzYvXmHE/90aelf+8dn3YHKHgpqMlflUoR0JYlWG6tjQnAwAGPUxW2h6uWEu5m/XFsCUeVRTSoVobw4V9XtPel2cjYYLtn3wqdB9A==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0ac9679-5046-47bf-bc3e-08d8879116f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2020 05:00:49.7064
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +lqSwgHT/558rfD24hTUE1FDwFxz2Yzeyt4mT2qr5RvLV43Y1KU/N1G8aRfVOGt/IBwBB34DLEKpgmH6AFK0ay9ZZx/TJle9cZ0n51ZbJq5TRbgwEvshfsLFYlz2lOw7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5611
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

> From: Wolfram Sang, Sent: Tuesday, November 10, 2020 11:21 PM
>=20
> While working on another improvement for the reset routine, I noted an
> issue with an old Gen2 SDHI instance which did not have a SCC. It turned
> out that we never distinguished between the SCC and non-SCC versions on
> Gen2 when it came to resetting. So far, it went OK but my upcoming
> change broke. So, this series fixes the underlying issue by only
> resetting the SCC when one is available.
>=20
> I made very fine-grained patches because this driver is so fragile.
> Nonetheless, my tests on a Renesas Lager board (R-Car H2) and
> Salvator-XS (R-Car M3-N) were successful. Debug output showed that
> proper code paths were taken and checksumming large files worked as well
> as reinserting cards. The patches are based on mmc/next and 5.11 will
> do because there seems to be no issue with current kernels.
>=20
> I'd be very happy about further review and testing!

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

And, I tested on Salvator-XS (R-Car H3 and R-Car M3-W+). So,

Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

