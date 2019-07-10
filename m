Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5956964C9D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jul 2019 21:16:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727923AbfGJTQA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 Jul 2019 15:16:00 -0400
Received: from mail-eopbgr1400111.outbound.protection.outlook.com ([40.107.140.111]:7892
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727612AbfGJTQA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Jul 2019 15:16:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dTm/uQgxMnU4IlZ3H08uAm+Xa/C5uPw8WqW99BaSanwdbc7iTRQdpUAnJ+xcgrR2YvaywVt+dXL3YuhozSRDqSzNje6WWLCslHOyhhEkOpC8LWWne1SJH4Hy9Ql9PDmlOofBngioL5k/GsOjSSDuvq3kWOYDueCuLh4z3icHf5gga5LuzRskwwPaJcA555gpajF6jX4hB20oZJHjm4b84jFxjcvm6CjjHrEv7tt68o+Ok24yXdHdfmwY3BIpX8qCrIrBB5mfDyAA5nB7DZKDthlnkHQcDBGTcaLpA7CUbRYeTeaEzfOd8uMS1k0Hk86gf0mH0Srr9Fi/UUN1IBBAKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eM/RhkgOFN+aJ06q4BFG5m7HqZ4iCTRO7Kuz2gdLc9g=;
 b=MFpkYCvgyPJxa8/EfYbZS+T4PKEJB8Exl8Vb6KfpPz3gIPakIC1DqUajPaXXgen/eMchdflfAbyZfNGHWmakla7ulPyEuXPjygSgEbCwN5YbooENxeA2w1h6sfsYQBDhW9rnU2KK8HqVo6xV+0KmpS9CpPyXJFDfQHXJrcaf3kY2LqQsqSCgCreUA6es1yStjynHbgzhYtcTl0ufoGtwOk+DAOo+qzoXj0KRc5oxg4TynPgB8KgJcURyOR16ZW23UnX8zZWMTxxtEcutQweHpBKFFzhB+ne9tJN8Nqdb1bOTMq0IxoJrdKMYUJHLR25ZiaGW3D+AAvdMAM+fZdzMgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=renesas.com;dmarc=pass action=none
 header.from=renesas.com;dkim=pass header.d=renesas.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eM/RhkgOFN+aJ06q4BFG5m7HqZ4iCTRO7Kuz2gdLc9g=;
 b=Yr/q3q60v6SXgNApN5rhnLR2Wb8ztjLDyrHSIjpqBIlTHChWAOWoIqCWZO3fppLobJ+M5Pgs3nF6k/gGqyvGdzBpT+MW/AVRoQm3QSrcIsYR+yKcfJxreex4gInGlOlP8bhmTw1grNxZttVm9ghlwYPMEATQccI50NxBrGAfQ68=
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com (52.133.163.12) by
 TY1PR01MB1532.jpnprd01.prod.outlook.com (52.133.162.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Wed, 10 Jul 2019 19:15:57 +0000
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::441a:2bf7:e01e:a247]) by TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::441a:2bf7:e01e:a247%7]) with mapi id 15.20.2052.020; Wed, 10 Jul 2019
 19:15:57 +0000
From:   Chris Brandt <Chris.Brandt@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH rza_u-boot-2017.05 0/2] rza2mevb: Allow using Ethernet
 when SDRAM is enabled
Thread-Topic: [PATCH rza_u-boot-2017.05 0/2] rza2mevb: Allow using Ethernet
 when SDRAM is enabled
Thread-Index: AQHVMn5n9ESgvWNuvEqY4EXyomsghqbEORZQ
Date:   Wed, 10 Jul 2019 19:15:56 +0000
Message-ID: <TY1PR01MB1562B65595974A21F6751D9C8AF00@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20190704153726.10507-1-geert+renesas@glider.be>
In-Reply-To: <20190704153726.10507-1-geert+renesas@glider.be>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcY2JyYW5kdDAxXGFwcGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEyOWUzNWJcbXNnc1xtc2ctMjMzZGU1ZDItYTM0Ny0xMWU5LThkOWMtNWNjNWQ0NjFlNzI0XGFtZS10ZXN0XDIzM2RlNWQzLWEzNDctMTFlOS04ZDljLTVjYzVkNDYxZTcyNGJvZHkudHh0IiBzej0iMTM5MSIgdD0iMTMyMDcyNTk3NTUyNjYzOTM0IiBoPSJFdGhMdCtCUnl2NDlFbEhKdHhkSU5ITU85Qjg9IiBpZD0iIiBibD0iMCIgYm89IjEiLz48L21ldGE+
x-dg-rorf: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Brandt@renesas.com; 
x-originating-ip: [75.60.247.61]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 595e7732-f39f-4925-c084-08d7056b093a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:TY1PR01MB1532;
x-ms-traffictypediagnostic: TY1PR01MB1532:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <TY1PR01MB1532FFCE04054800AE7801908AF00@TY1PR01MB1532.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1227;
x-forefront-prvs: 0094E3478A
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(136003)(396003)(39850400004)(346002)(366004)(376002)(199004)(189003)(66476007)(66556008)(53936002)(256004)(476003)(74316002)(14454004)(102836004)(99286004)(6246003)(66446008)(64756008)(76116006)(26005)(3846002)(446003)(8936002)(86362001)(66946007)(305945005)(4326008)(81166006)(71190400001)(71200400001)(81156014)(55016002)(8676002)(186003)(7736002)(478600001)(25786009)(68736007)(966005)(2906002)(6506007)(6116002)(11346002)(229853002)(9686003)(52536014)(6436002)(66066001)(76176011)(316002)(6306002)(7696005)(33656002)(5660300002)(486006);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1532;H:TY1PR01MB1562.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: bFEPQpn6CVvqyieIH+AcDeVigOEvIRx3wNby4QB6GlpyA7NKMFxcTCUj0m+8jZ4X5IgQeNV2QjqajFCZ5jSwMY1FXXt6epbSP1BPZUQuFkbTg4AamfptxhBW2gqrLl9hjfwZSTil8E3nL2Kya9qnkxVxSvlbxi+FUETZbtVCYZmoQ4MsSOEsJ9MLIKMNk8oDXoxLFlIESGe3p3So+5OG7CXgVTU1D6A5GStoCwauzL0Qu3ggDzgYtNGCkdyTGPga8jp/pqPNogU7Mvc+hpjouS7qiAuQIF42hnJKiNFN9qQ2gUdtwKbvNIpuONwE9O2N5WRyJThgJr/aTKEEpNa2Mob6wKHkFRb33o5mLUUEw1TFaXnMJxIWyaG0FhJgyZ5wt6bmOb1Yvk+sv9ChBaLs2q6419HA+8ZqU78sgIJDjpM=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 595e7732-f39f-4925-c084-08d7056b093a
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2019 19:15:56.9610
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Chris.Brandt@renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1532
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Sorry for the delay while I was on vacation.

On Thu, Jul 04, 2019 1, Geert Uytterhoeven wrote:
> To use the 64 MiB of SDRAM on the RZA2MEVB development board, SW6-4 must
> be switched off, making the first Ethernet port unavailable.
> Fortunately RZA2MEVB has two Ethernet ports, so this patch series makes
> U-Boot fall back to using the second port instead.

Thank you for the patches!


> While this allows me to use TFTP, I still cannot boot my own non-XIP
> Linux kernel (uImage with LOADADDR=3D0x0c008000), as it seems to crash in
> the "blcs cache_on" in linux/arch/arm/boot/compressed/head.S.  A similar
> kernel boots fine on RSK+RZA1.

Maybe it is because of the fact that for RZ/A1, both the RSK and GENMAI=20
boards are using CS2 so the SDRAM was located at address 0x0800000.
But the RZ/A2M EVB has SDRAM on CS3, so the address is 0x0C000000.


Here was a patch that I had to do back in our linux-3.14 kernel for=20
those that were using CS3.
https://github.com/renesas-rz/rza_linux-3.14/commit/86ee3b7bc1f5


It looks like the current kernel has the same mask, and will need the
same fix.
https://github.com/renesas-rz/rza_linux-4.19/blob/master/arch/arm/boot/comp=
ressed/head.S#L207


Does that fix your issue?

Chris
