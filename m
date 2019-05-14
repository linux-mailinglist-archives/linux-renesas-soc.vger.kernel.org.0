Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25A9C1D12F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 May 2019 23:19:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726490AbfENVTf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 May 2019 17:19:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:53642 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726134AbfENVTe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 May 2019 17:19:34 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A504C20873;
        Tue, 14 May 2019 21:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1557868773;
        bh=+KDMoLaxjjfTgrLza0xRM2hNVZ4vloQuz//YOp2frGM=;
        h=In-Reply-To:References:From:Subject:Cc:To:Date:From;
        b=pTPVRQNTaJojaQ0GqBt/fEENNLqPRrXJxWTCL/0pVycdw/ItgYUTeECXfmnuDzOq/
         ILAA/qtQ7RokSpwdkr2pc9dhBTTS7OSxTu3H6xwzsPF8Q+S9CPrrV1om52Xe1bWJlY
         b1Z7yHqOUND7mtrRQvNE/NBbUVPs1FgWSOAmvH9s=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190514153341.22540-1-chris.paterson2@renesas.com>
References: <20190514153341.22540-1-chris.paterson2@renesas.com>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] scripts/spelling.txt: Add spelling fix for prohibited
Cc:     Biju Das <biju.das@bp.renesas.com>, linux-clk@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chris Paterson <chris.paterson2@renesas.com>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Message-ID: <155786877257.14659.6751252865489860937@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Tue, 14 May 2019 14:19:32 -0700
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Chris Paterson (2019-05-14 08:33:41)
> Misspelling 'prohibited' is quite common in the real world, although
> surprisingly not so much in the Linux Kernel. In addition to fixing the
> typo we may as well add it to the spelling checker.
>=20
> Also adding the present participle (prohibiting).
>=20
> Fixes: 5bf2fbbef50c ("clk: renesas: cpg-mssr: Add r8a77470 support")
>=20
> Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

