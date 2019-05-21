Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D74572572C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 May 2019 20:01:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729167AbfEUSBi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 May 2019 14:01:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:53802 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729098AbfEUSBi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 May 2019 14:01:38 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A7A30217D7;
        Tue, 21 May 2019 18:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558461697;
        bh=FLZhdWunrjebuUQrgaFqGqa/3rfm/mslltrgtD0N4gs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=wS2iQRdgmag5T8KZvfo76T4L2N8wQBpCRchW2qiTLxHhUwzNJL3O++yzcPmBvnjZA
         r+yVm3fzoyYi+cNk3Rmmu16l6Z4vxzBmdVkKgBgHqJz2eacSya9ozeO6PsoZZGgJwK
         PlC/1IU3tBqdzdMFjeMaY9LVmBs9ewvAhKrfX0wA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAMuHMdVOKDRYjzmyRq-KXW8d+dYmAxnM+=y2yOh85YDcCEDMuw@mail.gmail.com>
References: <20190514153341.22540-1-chris.paterson2@renesas.com> <155786877257.14659.6751252865489860937@swboyd.mtv.corp.google.com> <CAMuHMdWPSyrhYx5Z5mgmKrR68cHL6owcRT=B3+DD3GhhxuG4zw@mail.gmail.com> <20190516215406.75E5D2082E@mail.kernel.org> <CAMuHMdVOKDRYjzmyRq-KXW8d+dYmAxnM+=y2yOh85YDcCEDMuw@mail.gmail.com>
Subject: Re: [PATCH] scripts/spelling.txt: Add spelling fix for prohibited
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
User-Agent: alot/0.8.1
Date:   Tue, 21 May 2019 11:01:36 -0700
Message-Id: <20190521180137.A7A30217D7@mail.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2019-05-21 01:57:20)
> Hi Stephen, Andrew,
>=20
> On Thu, May 16, 2019 at 11:54 PM Stephen Boyd <sboyd@kernel.org> wrote:
> >
> > Guess so! Or Andrew does it.
>=20
> Given the change to scripts/spelling.txt conflicts with b937856a5db2cb7a
> ("scripts/spelling.txt: add more typos to spelling.txt and sort") in
> linux-next, and the risk of conflict with future changes to
> drivers/clk/renesas/r8a77470-cpg-mssr.c is slim, I'd like to defer this
> to Andrew.
>=20
> Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Ok. Or Chris can split the patch into the clk part and the scripts/
part?  They're only loosely related to each other, so I'm not sure why
they were sent in one patch besides for ease of transport.

