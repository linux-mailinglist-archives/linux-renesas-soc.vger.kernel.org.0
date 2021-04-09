Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DBA0359E4D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Apr 2021 14:06:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233610AbhDIMG4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 9 Apr 2021 08:06:56 -0400
Received: from mail-eopbgr1400097.outbound.protection.outlook.com ([40.107.140.97]:15392
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233009AbhDIMGz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Apr 2021 08:06:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q/KbXwUbHGvweDNdEG56Yn2bAHk3MeHqXTlwl7F2F/OEK3FgZzJxHnie/tv5OS/ZwXIYW6MsOQnUgTDAGi9FZ5eCh2ZyXquPAB8CsHTRyzoU/r8Ha3QcuFMzaUhqfwqgB69CisRZe4dWzmLVCVTmtr50PBiVBhbpEM8Y3BMhOYURgIMpdnD5lb+g7DgNadbsmoQt81P5newrmbpMzbmeY4fxyj6H3ojj3rYTnNdYIAesrJqx0ATbzS9EoBO0ABPtGkJ6SuWfPp+DPsMUw6RaHDkwgPE3v6zI56OIIKkIPZaiMu2qWPhnL5EqoF0z27AX6Eg9ehVIXxXhyNy25oTCUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=98XX11090SGn9P0L+2Kpa5jk7WBMF9816vhd08YZ6OQ=;
 b=EdbHo007ElyVNGHbNvicWzCFX5JV6yF/oGzt9erUkN/t5pK8x9JQLOcVBjXcTZ552td4jdj+KdneC1nca07R06k/TyWLLup7zvFjSyLiIrQq1kk3zmjUkDjs/RN79eNVjBztJT5fd/crzkJybard4WkksbOarO6LFHlWtJyuPA4WKbr4ptCS7frLfBESgr2YAQOhn4+RtI13X1dPtOurQLiq4m6IvT4Z56Pfcd+wZQy6ZrHyQ8vMzx3QquDvBb4+qRUL/X6EN20V7x3cjtE1emBGx/ozE5oyqPBivOQmvUY7smIX9q7na7EP4HvjmZvy1QwABmzUNvlAkLL386iXzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=98XX11090SGn9P0L+2Kpa5jk7WBMF9816vhd08YZ6OQ=;
 b=ZA9fQAMN47e3zNPONgdn75iUKH6+v/Z30mzQA/aoVPpnYAZsKaBa8P3u3YXvbRqnrLUEQ6fzBwinpe/OfDOiOBU+HeOaS+8L0QmkaOpAlr4eQfu+HToTbswplNbOJ9STPginLixhrj4mQ6I5y2G9DRam2kF5uDgTOfDvK/aLma0=
Received: from OSAPR01MB3683.jpnprd01.prod.outlook.com (2603:1096:604:33::12)
 by OSBPR01MB4166.jpnprd01.prod.outlook.com (2603:1096:604:43::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Fri, 9 Apr
 2021 12:06:40 +0000
Received: from OSAPR01MB3683.jpnprd01.prod.outlook.com
 ([fe80::7de7:7e65:a509:e3a0]) by OSAPR01MB3683.jpnprd01.prod.outlook.com
 ([fe80::7de7:7e65:a509:e3a0%4]) with mapi id 15.20.4020.017; Fri, 9 Apr 2021
 12:06:40 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
Subject: RE: [PATCH RFT v2] mmc: renesas_sdhi: enable WAIT_WHILE_BUSY
Thread-Topic: [PATCH RFT v2] mmc: renesas_sdhi: enable WAIT_WHILE_BUSY
Thread-Index: AQHXLSUuSEx6czrS00qppUC98YBy46qsFuPg
Date:   Fri, 9 Apr 2021 12:06:39 +0000
Message-ID: <OSAPR01MB3683B0F4D59B09713568CF18D8739@OSAPR01MB3683.jpnprd01.prod.outlook.com>
References: <20210409094606.4317-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210409094606.4317-1-wsa+renesas@sang-engineering.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: sang-engineering.com; dkim=none (message not signed)
 header.d=none;sang-engineering.com; dmarc=none action=none
 header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8f16042d-2c7b-4e31-28d0-08d8fb4feee0
x-ms-traffictypediagnostic: OSBPR01MB4166:
x-microsoft-antispam-prvs: <OSBPR01MB416632434DDFAAED78F80970D8739@OSBPR01MB4166.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Rfrv9s3oyfBrdCJ8zBasXsKrXL3mI0BBo3zqnuUI/tWgHpUEx7RnjCOG3hEniuWPDqmaTHZl6DeUA0o44x7vphg5RFyIodL6lHyJ4w9wtNzsQiy650IBk6obFtCLqb1fjvKWrcqu16MPIoWA2T45XlpNoy3js+vTG7Z/KzdQkZja1X9yDNsrXPxIykK0NRyi2LsV7kEQKFTOjkb7qXYYqWqT3RqA+jwxWFDUEO+UD2aSxNufxrD2tbnMjsBXmZSuagtt/23T6yj2lGvAzJiV031a4iQlI++YXCcmaua2rM/+TF2DYSpaWCj4vVb+IqJ66we2B+R2RlskOB+aceNdTZbVmMprYXqffSAWFTD7wepMwmSN8LNRMFlRR0lTFfzvtg88lRhJvGl14RDeKFhF+6f9TQgwlGKWoA2vJ4UtE564zqIq2TXIZ4deUA9HrgVdy5Tuxz+DEgvyjo8vs09XXsNvGofwzxlqeEBa1L9xOM6dJt4oo4Yojyau+o4xHzku/AOpyDih5IAk9UcHPlHTrNyt0ER5NPmkhc5g0zZQkqpBxaKTK4kGDrw9zdXtUEPKelN8MF1IaGyudubTtTlA922MJBdBBm/caBEDIkEJn+q+YIV2uoX+B78pqJw20HSnTbroHEytNG1DOpqgoXMPVwIxWsgZTBqwlikEfGA4n0Y=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB3683.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(39860400002)(346002)(136003)(366004)(8936002)(4744005)(52536014)(38100700001)(186003)(71200400001)(7696005)(4326008)(55016002)(6506007)(54906003)(26005)(66556008)(66476007)(64756008)(9686003)(2906002)(5660300002)(66446008)(8676002)(55236004)(76116006)(86362001)(66946007)(316002)(33656002)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?WBE9MSNKeHKvMCRgMcT9mSQ5Q10UPTYkQIiJBYRGozuS4r9nyorfpGaHSRad?=
 =?us-ascii?Q?fiN6ttiSBXW5qqfji9nHJjwFZMLa1+PklhDyu3gWEN4eacg1RONrmIQrt15G?=
 =?us-ascii?Q?6RZNTFvYRrltFXkByOvT+Z0Uz5zLszeE0Le/IIN5fMeYavSiht1iCm52hmUX?=
 =?us-ascii?Q?BW1T6fbslgrbrm/ShbdxwlUfgHBJyBm90T57VCoPCnTsMe7QR3jvW63LU8e5?=
 =?us-ascii?Q?TIQ5YyjPe6sDtNc+6I4kj2XQPAkoL9PLdOaDDxCahj6jKdM/qyDwg6Lo/M/8?=
 =?us-ascii?Q?OUfyH4f1CyQOv/zqQ+cRPPbUFwt0X/A51xNMQAyhA+P/pAUg/E2pvsQns0wW?=
 =?us-ascii?Q?XEnSh2+pVRtEemTR2YDfQXujGNipzrVZMK1DPcc6wBKis1TO38T5gBZGz9ve?=
 =?us-ascii?Q?bl4PFcXKH8mZoNq8HMgZbF82EeZoaQYBKGuoRkPNYym5yLSfFfBibgNj6P3l?=
 =?us-ascii?Q?BXY/sH1MzQ5TEDon+0NDmPeddl8uREVOI+kZZovXWTqI3eK5y7H5+XqHriGR?=
 =?us-ascii?Q?j/7q6ORwcTHvK4aXT1jgge5qysMARpOONR1rMcODO8gxydrsXIcbMIYjYIi1?=
 =?us-ascii?Q?In6tulVtoI/4ssetoXdkBGI4IE1eQbLioMp0/ZKVSiVUA4qdDgT48OTCUD0X?=
 =?us-ascii?Q?37VP+Mh+0o3v3EmD4D/OiQmxS4cSJVQ7gFn/FgIUnU0wcdyA5vEXrkOwMeGS?=
 =?us-ascii?Q?cFSZdQmpk9mTq+btp1mEYpaqMevgEJm0mBEDCpaZj4t9l7n8odxFpFEJHzqt?=
 =?us-ascii?Q?duzWXc2iDkZL7LI5IDWU2sgNMb90J/SM3xZlCrTQstZVc1g2nApjAsPYNI/a?=
 =?us-ascii?Q?y4AUVr0AzYyixs+brrDHttg4atxwPoPlLcWRahZ5fYTuZF6tRUZ15HcKvNdX?=
 =?us-ascii?Q?qmjL01XhA+fy2FR161/0mskhK3c4xVHJQ2CfLjAx3OHhBxUPxywlKZ8Fc/26?=
 =?us-ascii?Q?A6V03ECbkBrRWnX62ezVUrcA1JTV34E2o8jXrKspzrCtHNLfGtl+Qlo3n8Xa?=
 =?us-ascii?Q?klAAL37WzfdEl7q96MJz9CKoeDi6/zw6e2A0G2EF+fraoKE5SYZxBiC1mUcA?=
 =?us-ascii?Q?Uv8P5i74d9EN+35p04HufufftyeFNymg2GRn9ou7ffxuyfuLc2Tcz+XYQupg?=
 =?us-ascii?Q?0muT7D0KN9wzhq2Z1Krj2lBU3QmxwA5salUYNmSHEgZUzjtKti2rx2KktKyW?=
 =?us-ascii?Q?St2GPl4qt41RuWCHQ3NNldm2CTtlTH6j2Pg22MPtyZX1Gh2/QL3NjdEp6Hxi?=
 =?us-ascii?Q?Y3/3xhPbw7Go1uFnE2a+edKDh6UsDhkTN1dAAaBkRC0i8KFQoRYu4c9NEfcm?=
 =?us-ascii?Q?tDRvzv6oNAcNLoB2pFATtEZP?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB3683.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f16042d-2c7b-4e31-28d0-08d8fb4feee0
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2021 12:06:40.0132
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3Oaffwedp6H9ni9AbIPdXrhq1B5/Den3mIWdfZjzcOTt4QlSSzXiBt4T+KOEBq746xoHYOZJwaYQhXmOBpB+PvnpjVmLYLWUGivx+QyWdPfCZ5BywHMmDJIHOmsE8RLi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB4166
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

> From: Wolfram Sang, Sent: Friday, April 9, 2021 6:46 PM
>=20
> Now that we got the timeout handling in the driver correct, we can use
> this capability to avoid polling via the MMC core.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

And, I tested on my environment (R-Car H3 ES3.0) and I didn't
observe any regression. So,

Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

