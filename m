Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15D392858E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 May 2019 20:06:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387408AbfEWSGD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 23 May 2019 14:06:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:57258 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387459AbfEWSGD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 May 2019 14:06:03 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4F1392075B;
        Thu, 23 May 2019 18:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558634762;
        bh=Gyx2hArJLhSjz8DFDz06LPHgB6UT6k+TTjBqkTmyTZM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=OpVambGhn6bJsp9ZAVnPRB0WbFaf8jNrcQN3R9dJaqkyld2pYHQ7NHRBHv2uMEzYl
         5XYImRKY7ZGYIb3+jt4g6wF+xPpAwHDfdt05VHfYMWlTCtGepdLw8IOFu6uKVR72fB
         TGrv9sCqwZ4ytqyDpga8exUn/tCbUbH1YPH+MP+A=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <TYAPR01MB2285F1CD8540CBC4795D8708B7010@TYAPR01MB2285.jpnprd01.prod.outlook.com>
References: <20190514153341.22540-1-chris.paterson2@renesas.com> <155786877257.14659.6751252865489860937@swboyd.mtv.corp.google.com> <CAMuHMdWPSyrhYx5Z5mgmKrR68cHL6owcRT=B3+DD3GhhxuG4zw@mail.gmail.com> <20190516215406.75E5D2082E@mail.kernel.org> <CAMuHMdVOKDRYjzmyRq-KXW8d+dYmAxnM+=y2yOh85YDcCEDMuw@mail.gmail.com> <20190521180137.A7A30217D7@mail.kernel.org> <TYAPR01MB2285F1CD8540CBC4795D8708B7010@TYAPR01MB2285.jpnprd01.prod.outlook.com>
Subject: RE: [PATCH] scripts/spelling.txt: Add spelling fix for prohibited
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
To:     Chris Paterson <Chris.Paterson2@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
User-Agent: alot/0.8.1
Date:   Thu, 23 May 2019 11:06:01 -0700
Message-Id: <20190523180602.4F1392075B@mail.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Chris Paterson (2019-05-23 02:07:51)
> > From: Stephen Boyd <sboyd@kernel.org>
> >=20
> > Ok. Or Chris can split the patch into the clk part and the scripts/
> > part?  They're only loosely related to each other, so I'm not sure why
> > they were sent in one patch besides for ease of transport.
>=20
> Happy to split the patch if you want. I combined the patch as I saw that =
done in a couple of examples in the git log.
>=20
> However, I got an automated email from akpm saying that this patch was ad=
ded to the -mm tree; so I don't know if you still want me to split up this =
patch or not.
> Let me know.
>=20

Everything still looks fine to me so I dont' think you need to do
anything.

