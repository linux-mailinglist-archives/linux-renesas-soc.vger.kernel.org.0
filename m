Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A06216104F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Feb 2020 11:44:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727186AbgBQKoB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Feb 2020 05:44:01 -0500
Received: from sv2-smtprelay2.synopsys.com ([149.117.73.133]:41882 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726963AbgBQKoB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Feb 2020 05:44:01 -0500
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id DD0D4404BE;
        Mon, 17 Feb 2020 10:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1581936239; bh=k6FBbqCL+uvwtuA1EkkAjtEs3/s/2yQaEf/+y4Q/nYI=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=gPtFS07pctSzpj069ilUKA3iLhbRgpdjHm+5OUGe8r0eCvHg4A0G0TAdpVttLKO6D
         aO4/xl/4NxzNM6BsoT5oUcmI2Ky/9ooxn0g3kqnOsrbULW8ipDng4JcRvS4uwkKoki
         4pIS1NIISSw+YPk8HmWO1R0/CeAUkMcj69r0+emEzmQ2e+WOgxVpRziOqk+8gv1bXE
         5uZaEO1t4DZ9keH6xIiVMntilLnzTpJ8nd9c6ahgAUVsN831YXM6ZAES0+7sah0X8w
         4UZyGOFRjj4XIbpNI0r8hBZ/4vu/NRlvLw84IATEs2FzRKQX7tjPMm8bq1JxKmuy8W
         F+n0PzJQAMvjw==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 701DAA0079;
        Mon, 17 Feb 2020 10:43:51 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 17 Feb 2020 02:43:51 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 17 Feb 2020 02:43:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ASCwKfZox+mpuZ3ChWJlifxw47mJWlANuftRTS9AUdDkLiAZLN1S7JRXljs2gC010ZHCRjIvSGp0qC59IpWgaZlLnuLyijh0A5w+ncdB82yoXP4A7x2BXOkrUksZrasP7B81isFrJE3PEi1mHoqFetmY7CpIjwkBHjNaOFys69h5+6UDGofjLK1Hla5qPasWKwzt7gjq453SnhZinAc8STtf11OGHijxK+zzUj1Gi73oWg/U941vY7L58swiN2ga46g1DAxV1+EzpSLan6qBrovL8RNSwvR8ReM/OltLSkw0akTRxSFXojVhRMj7oLUanMCZOocDiHiuy52JU1PhZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IkrwUQv3r+1/DUhBxuQh9Bcr3JINCdOtG3fBjPAekU4=;
 b=P4lH1VzxnMPr1w2L6GLwNCKEsD8gN+2AtQb46JOG7pmztDF+OHPHznUPrOiZIqocZb5MnRvzN0G5G9aOtNuiF5BfeVmwsuN/58Re7OMEZX0H1PsDY+A/VMWWY+OJ1zcghsj4JyDlSimhFqsZmc29gjBfsMEiFZUb5C/6Fc5osRG0whi4op9ZNTuChE7pYXR9sdVWa5D+ZUWZaPlWmtPrZGQiLGt0HC1R4WhoUfIZ2gWdJXexhCRyTr568FZqALhVhqQcxHw0IqoAUlJoYCkUUcShZFgAgUkLo3/PqXpcNhtn6EUgPAcjsC1jFfnR3c3vrxUIltIzAGi27L7BnsHajw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IkrwUQv3r+1/DUhBxuQh9Bcr3JINCdOtG3fBjPAekU4=;
 b=UJocZ5Yn8OYYsMl6xvAQ16+0h+58QymYyTt86N5KJjn/pPyZExsB5MacdgFw5tbgfMn5jA1yDvotvGBA9NAiiJVxGmsHXcNdXM0VKj99YUiPjsP9tGWV9fMsdEWitZkpmeBr+P7aJV45sDCPYmhLteItcGwilXbmIz9/3ZchCAY=
Received: from CH2PR12MB4216.namprd12.prod.outlook.com (20.180.6.151) by
 CH2SPR01MB0010.namprd12.prod.outlook.com (10.141.106.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.22; Mon, 17 Feb 2020 10:43:49 +0000
Received: from CH2PR12MB4216.namprd12.prod.outlook.com
 ([fe80::c8d1:bea7:c855:bcfe]) by CH2PR12MB4216.namprd12.prod.outlook.com
 ([fe80::c8d1:bea7:c855:bcfe%5]) with mapi id 15.20.2729.032; Mon, 17 Feb 2020
 10:43:49 +0000
From:   Vitor Soares <Vitor.Soares@synopsys.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Boris Brezillon <bbrezillon@kernel.org>
CC:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>
Subject: RE: [PATCH] i3c: master: no need to iterate master device twice
Thread-Topic: [PATCH] i3c: master: no need to iterate master device twice
Thread-Index: AQHV41GzBn58rFNQeEmeYYBHggBYfKgfNiJA
Date:   Mon, 17 Feb 2020 10:43:49 +0000
Message-ID: <CH2PR12MB42164D05C1C4353CAC9F4B75AE160@CH2PR12MB4216.namprd12.prod.outlook.com>
References: <20200214145853.24762-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdWwXOb5vkexeop7zaqm7aUYcfMojVj+VrjuTUXJ+kaamA@mail.gmail.com>
In-Reply-To: <CAMuHMdWwXOb5vkexeop7zaqm7aUYcfMojVj+VrjuTUXJ+kaamA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: bbrezillon@kernel.org
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcc29hcmVzXGFw?=
 =?us-ascii?Q?cGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEy?=
 =?us-ascii?Q?OWUzNWJcbXNnc1xtc2ctNWYyYTQwODItNTE3Mi0xMWVhLTgyOGQtYjgwOGNm?=
 =?us-ascii?Q?NTlkN2ZjXGFtZS10ZXN0XDVmMmE0MDgzLTUxNzItMTFlYS04MjhkLWI4MDhj?=
 =?us-ascii?Q?ZjU5ZDdmY2JvZHkudHh0IiBzej0iMTQ1NCIgdD0iMTMyMjY0MDk4MjY4Mzcz?=
 =?us-ascii?Q?MjY1IiBoPSJkSEhCWVhTTWM4Z0ZsV3Rld0JSV0tTQ3ZIc0U9IiBpZD0iIiBi?=
 =?us-ascii?Q?bD0iMCIgYm89IjEiIGNpPSJjQUFBQUVSSFUxUlNSVUZOQ2dVQUFCUUpBQUFS?=
 =?us-ascii?Q?NGRJaGYrWFZBVFk1cHhucFBHNS9Oam1uR2VrOGJuOE9BQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBSEFBQUFDa0NBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?RUFBUUFCQUFBQXNQcFJHUUFBQUFBQUFBQUFBQUFBQUo0QUFBQm1BR2tBYmdC?=
 =?us-ascii?Q?aEFHNEFZd0JsQUY4QWNBQnNBR0VBYmdCdUFHa0FiZ0JuQUY4QWR3QmhBSFFB?=
 =?us-ascii?Q?WlFCeUFHMEFZUUJ5QUdzQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFF?=
 =?us-ascii?Q?QUFBQUFBQUFBQWdBQUFBQUFuZ0FBQUdZQWJ3QjFBRzRBWkFCeUFIa0FYd0J3?=
 =?us-ascii?Q?QUdFQWNnQjBBRzRBWlFCeUFITUFYd0JuQUdZQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBUUFBQUFBQUFBQUNBQUFB?=
 =?us-ascii?Q?QUFDZUFBQUFaZ0J2QUhVQWJnQmtBSElBZVFCZkFIQUFZUUJ5QUhRQWJnQmxB?=
 =?us-ascii?Q?SElBY3dCZkFITUFZUUJ0QUhNQWRRQnVBR2NBWHdCakFHOEFiZ0JtQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQkFBQUFBQUFBQUFJQUFBQUFBSjRBQUFCbUFHOEFk?=
 =?us-ascii?Q?UUJ1QUdRQWNnQjVBRjhBY0FCaEFISUFkQUJ1QUdVQWNnQnpBRjhBY3dCaEFH?=
 =?us-ascii?Q?MEFjd0IxQUc0QVp3QmZBSElBWlFCekFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUVBQUFBQUFBQUFBZ0FBQUFBQW5nQUFBR1lBYndCMUFHNEFaQUJ5QUhrQVh3?=
 =?us-ascii?Q?QndBR0VBY2dCMEFHNEFaUUJ5QUhNQVh3QnpBRzBBYVFCakFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFRQUFBQUFBQUFBQ0FB?=
 =?us-ascii?Q?QUFBQUNlQUFBQVpnQnZBSFVBYmdCa0FISUFlUUJmQUhBQVlRQnlBSFFBYmdC?=
 =?us-ascii?Q?bEFISUFjd0JmQUhNQWRBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFCQUFBQUFBQUFBQUlBQUFBQUFKNEFBQUJtQUc4?=
 =?us-ascii?Q?QWRRQnVBR1FBY2dCNUFGOEFjQUJoQUhJQWRBQnVBR1VBY2dCekFGOEFkQUJ6?=
 =?us-ascii?Q?QUcwQVl3QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBRUFBQUFBQUFBQUFnQUFBQUFBbmdBQUFHWUFid0IxQUc0QVpBQnlBSGtB?=
 =?us-ascii?Q?WHdCd0FHRUFjZ0IwQUc0QVpRQnlBSE1BWHdCMUFHMEFZd0FBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQVFBQUFBQUFBQUFD?=
 =?us-ascii?Q?QUFBQUFBQ2VBQUFBWndCMEFITUFYd0J3QUhJQWJ3QmtBSFVBWXdCMEFGOEFk?=
 =?us-ascii?Q?QUJ5QUdFQWFRQnVBR2tBYmdCbkFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUJBQUFBQUFBQUFBSUFBQUFBQUo0QUFBQnpB?=
 =?us-ascii?Q?R0VBYkFCbEFITUFYd0JoQUdNQVl3QnZBSFVBYmdCMEFGOEFjQUJzQUdFQWJn?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFFQUFBQUFBQUFBQWdBQUFBQUFuZ0FBQUhNQVlRQnNBR1VBY3dCZkFI?=
 =?us-ascii?Q?RUFkUUJ2QUhRQVpRQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBUUFBQUFBQUFB?=
 =?us-ascii?Q?QUNBQUFBQUFDZUFBQUFjd0J1QUhBQWN3QmZBR3dBYVFCakFHVUFiZ0J6QUdV?=
 =?us-ascii?Q?QVh3QjBBR1VBY2dCdEFGOEFNUUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQkFBQUFBQUFBQUFJQUFBQUFBSjRBQUFC?=
 =?us-ascii?Q?ekFHNEFjQUJ6QUY4QWJBQnBBR01BWlFCdUFITUFaUUJmQUhRQVpRQnlBRzBB?=
 =?us-ascii?Q?WHdCekFIUUFkUUJrQUdVQWJnQjBBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUVBQUFBQUFBQUFBZ0FBQUFBQW5nQUFBSFlBWndCZkFHc0FaUUI1?=
 =?us-ascii?Q?QUhjQWJ3QnlBR1FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFRQUFBQUFB?=
 =?us-ascii?Q?QUFBQ0FBQUFBQUE9Ii8+PC9tZXRhPg=3D=3D?=
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=soares@synopsys.com; 
x-originating-ip: [83.174.63.141]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8a39028e-4cb3-41e0-486a-08d7b3964610
x-ms-traffictypediagnostic: CH2SPR01MB0010:
x-microsoft-antispam-prvs: <CH2SPR01MB00106EBE978B5ABFF4B32AEEAE160@CH2SPR01MB0010.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:619;
x-forefront-prvs: 0316567485
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(136003)(346002)(39860400002)(396003)(366004)(189003)(199004)(53546011)(966005)(6506007)(71200400001)(2906002)(4326008)(7696005)(33656002)(5660300002)(9686003)(478600001)(316002)(186003)(52536014)(86362001)(81156014)(8676002)(81166006)(26005)(66946007)(66476007)(64756008)(66446008)(76116006)(8936002)(110136005)(54906003)(55016002)(66556008);DIR:OUT;SFP:1102;SCL:1;SRVR:CH2SPR01MB0010;H:CH2PR12MB4216.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6hfLD3QWztATrYnmctySZsxxUkX9wjeqfMiH6SQS6wNG4GjMHWSbCbd9QV24aj6byU8H9fDRe2osIhUkHxmIEEQ63r66nDfNuyyImclB0s2IyO2mRpDv/MIyDF3H9hlHnguGK3vgfcOVFsReJbLyF1oPT7rHKmsvqjT9t66I6FJqlbOGg4L+EnIy+fAj6pUoW+T9rSSUL6lBA5NyaziI8fs9pNzI21Ze8p4OmUOyBaxImOMi5JvyoD2ELr06iHYBkNv/q0pxy5LzP6mP6m7ApYcZaPbk0JSrkFzE2PAQGPG/rD6QXfn1uaLuqSsizW2C+a1a8HXx7hBZw65r5n/dS2ZX1Fw9cqThpkEXo4YDW8sZVq1/hovz6tOjl0Fh0rpcV11QEAK+tqfiMHU6x1O1NwPRsyC18qRaTINeio5AGZKWmBD5FGiOvjER4XS7iD1VC8dptr0VodGrJ5PjKrimbvBMQiwx1FpypknQWSeiDn0zYhWlslukEp8rn1LvmunROWh/oyvC4+IuivD91/lWag==
x-ms-exchange-antispam-messagedata: XYy9mt+0FdrtN/RqIMF25QPOxL0VOd+0FVHFiwNfu3poiuTC/HC2SqKrhatKN2B/ljFmULXD2LWkZOiy2733CprE93FPMyBzb0nKI6/87XcuN5wVRgBNXa4PFnEgeZMWCFoE8XPB6GEB6x6z+9fU3g==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a39028e-4cb3-41e0-486a-08d7b3964610
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2020 10:43:49.6719
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y0twxK6pxpeoMktau4Y/0x6F8lAl16+fm1vcmyHJvC+24l6PP8WI4amqg4dpAYBKd6juK5syGuYRkOw019TpwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2SPR01MB0010
X-OriginatorOrg: synopsys.com
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

++Boris Brezillon,

Hi,

I didn't received the patch neither is in pachtwork I3C ML, it might be=20
held on the server.

@Boris Brezillon: Could you please check it?

From: Geert Uytterhoeven=20
<geert@linux-m68k.org>
Date: Fri, Feb 14, 2020 at 15:22:30

> On Fri, Feb 14, 2020 at 3:59 PM Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> > We already have the master device in a variable, reuse it.
> >
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>=20
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>=20
> Gr{oetje,eeting}s,
>=20
>                         Geert
>=20
> --=20
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>=20
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds
>=20
> _______________________________________________
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__lists.infradead.org=
_mailman_listinfo_linux-2Di3c&d=3DDwICAg&c=3DDPL6_X_6JkXFx7AXWqB0tg&r=3DqVu=
U64u9x77Y0Kd0PhDK_lpxFgg6PK9PateHwjb_DY0&m=3DFfrtbU5sjufe52Oll26A7hjX2dMLwq=
PN5ExIlo1a9Gg&s=3DrV3MuOuVG1GfYXy5GV-_7NNVoIu85gJVtkb_RSYRcJw&e=3D=20

Best regards,
Vitor Soares
