Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63FFB116743
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Dec 2019 08:02:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727117AbfLIHBK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Dec 2019 02:01:10 -0500
Received: from mail-eopbgr1410122.outbound.protection.outlook.com ([40.107.141.122]:52064
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726014AbfLIHBK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Dec 2019 02:01:10 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TTBXWiRhIDcJzoaE1JjiSXLC9HKg5Lchp+mmx2Sm6luH4CTiTbGwl59nsB9bwNFFNs3XPN6zDJ3N65xxYKlR0OddLPKpqDOewiyje3WAEYMUTMrI1oIvcE8KyuCyCMu8yqOeM4bcO5yQU2xak146XjYdtU58Ug+5yr+8eHencab3fpgP4THz4b6xlCUQo9G7mIlX/udeC6gEYSy8oKp+6WE5cdA9xSWV9PyEE4IRmMDdCBwIM8hLHD1osxEIMn7IowrnseMnMY6WpXkTUFGaZRNeLqdAO4GVOG/7FkkoQihP2vPSXhFfarcR5KwLt8LGKAKhYpaUxRxMASQ6QULoUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6lK8O3bYuOmmIyiJ2B/ObOM9zg7GojJq1bCqhoMTk9E=;
 b=BUppmU1dt0PznF71iMayCTXcUagv54VhW1UghorZ2KpeWIjulWEDFXQ1vLBFuBjL1B7a+X46YXsIxhrBw8Z/toCckjrD6JEu67aYxI+jfZGMLKB3LjQ0YjazcamXi7oJfA3Yzyfm0oV/7CnG0cDz7qp0ubhm/TMSrMP8EmwpOO0FjC3uel7yiqTvtfo6ksf6/K9LdN41tR/lSJ58ZQ8MX13f4S7XThxhHItZcFYXnj0FzwM9nslx3Nanuafl1jesu5dxxDtFuBa4L507PJFUcnrj4sxK/bOPisloaZlpxAfiHmHA6rI8FduMQuhDx1/68SM6gubREO/GKKq5tB9O+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6lK8O3bYuOmmIyiJ2B/ObOM9zg7GojJq1bCqhoMTk9E=;
 b=ZtDVeJdeJkoK1SVAAkExmy3Ils94MuLboQ8EZng3IhSTEdMN3CONOdlo7CTBiGhy0vN3E7bubTEhfk21bpHs7+dasTczcADxLzEYM8d/I89MoP5++cUTo+htlAn0V00rOFgc2sYVbUEk5WgymZdYw7gj2GQHaMiOohILkj89e64=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB4960.jpnprd01.prod.outlook.com (20.179.173.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.14; Mon, 9 Dec 2019 07:01:06 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::7d2d:4b8a:a48e:d84c]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::7d2d:4b8a:a48e:d84c%4]) with mapi id 15.20.2516.018; Mon, 9 Dec 2019
 07:01:06 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [RFC PATCH 3/2] mmc: renesas_sdhi: remove double clear of
 automatic correction
Thread-Topic: [RFC PATCH 3/2] mmc: renesas_sdhi: remove double clear of
 automatic correction
Thread-Index: AQHVqhjhA1MXHy4hbEyqxCcNoqX5I6exaISg
Date:   Mon, 9 Dec 2019 07:01:06 +0000
Message-ID: <TYAPR01MB4544B1A8425B6E40B8B1A24CD8580@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <20191203203301.2202-1-wsa+renesas@sang-engineering.com>
 <20191203203301.2202-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20191203203301.2202-4-wsa+renesas@sang-engineering.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [150.249.235.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 22ea95a2-f38f-4837-38a8-08d77c758fd1
x-ms-traffictypediagnostic: TYAPR01MB4960:
x-microsoft-antispam-prvs: <TYAPR01MB496013EB55C9B748CBD26177D8580@TYAPR01MB4960.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2512;
x-forefront-prvs: 02462830BE
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(376002)(396003)(366004)(346002)(39860400002)(136003)(189003)(199004)(71190400001)(71200400001)(66476007)(316002)(26005)(66556008)(76116006)(66446008)(64756008)(9686003)(66946007)(478600001)(81166006)(55016002)(81156014)(8936002)(8676002)(4326008)(6506007)(86362001)(76176011)(305945005)(102836004)(99286004)(229853002)(2906002)(110136005)(4744005)(52536014)(7696005)(186003)(74316002)(33656002)(5660300002);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB4960;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rkeqnBGKW6DARdOrzxKszoDZL5nYPJwjL6vhBZUs85QcW9eV+lmzSUXBhgOD4eS3kw4fhJoYwRaHysvUvDqqFugqLNPlgo2kOYtsm6lQva5No/Ab6RaCL4KLCxiC4JVlRM4lsfu7IXNrHRjfdsfvPbkdJw1a69+BSMYIdZXcZrA+OmV539Iju6/VMxFJz3OSAEuLdF43KD5ul6FjtXadl8XohVkK8kUU4A81cfzBbALJ3vuwaqWo2zx8Fd7wR+rUpGS8/YpxVCrhVFUO8PVv/AP89TtfRkN0v92iVz+m+6DEy7XZoCK6WogDq7yM2NHZIJSZxp0LJLzkR0BtmwSmNIUMBSTiu43O83dyFNS2a3//qneUEvIZGL5lgBrBtAmRT3EHB0rhnjqIQ+FaVvDyHrfQYNzHEZ4dZIIVuB/8hcs9rox8dKPs7HPc2t8lSEKr
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22ea95a2-f38f-4837-38a8-08d77c758fd1
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2019 07:01:06.0906
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0njlvh7IdVevCd0XTDcjIp37TOdcVx5aX7gdfIDsOxliNdU8CVbLa1SaUg4JDCsaUrYWkgv09QDJUDmzuJwhzD9G88owVzdSXv8AZ8g4v1turGO1K74l7kn4Sm5I4S5f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4960
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

> From: Wolfram Sang, Sent: Wednesday, December 4, 2019 5:33 AM
>=20
> hw_reset() clears the automatic correction bit twice. I couldn't find
> anything in the docs recommending that. Removing one of them didn't
> cause any regressions here, so keep it simple.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

