Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 727DC1A2BF5
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Apr 2020 00:42:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726512AbgDHWmf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Apr 2020 18:42:35 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:40119 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726467AbgDHWm1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Apr 2020 18:42:27 -0400
Received: by mail-qk1-f195.google.com with SMTP id z15so2097260qki.7
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Apr 2020 15:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Gx7CIn2jLm5j4xdRTQllP3gtsV1GD1rqAZK1dgPXufs=;
        b=QNvwhanRxS4Sp2j2LHSLQcsnvtI8nKLKCO4iJmFGW1B92LmBwTjRXgMu6hoA+3nu6a
         +AncNDjcl0kSubqIIKDmhQ/B4P0DWLjY944vQvPzXqfIZ/sCSq0fDEsgem3Gc5iICbyv
         0Y39n5KQM6xKjbVgPorJhsaiN2AuYU7Q0/dWwDhxN1r5mtViSRqRNidGJ/zth/jmXnAd
         Fj7J66gfSRWdqqRboP1FK189wHiA2ZAzhPdo2Mp8SJP9vg7U1rEBSGTCCasAVssBxBTy
         zYpfsDYyG5+n/7srZdc6jeXEQR+u64TxJV40NMVebs8Xh6UEw6KOAP5b0PcZX96oRtnX
         4fIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Gx7CIn2jLm5j4xdRTQllP3gtsV1GD1rqAZK1dgPXufs=;
        b=ABRsxnceYgH2252dtkek0Fo8ZHuNs/Bk78Fss5ArdjbmQM8FFW++toawFhqNOyocjr
         rgSWgahD7AsbtOJDnUtVMt+TLqTjQmu/XcdM4Rrv54GTqfbRRIL+bEN9JpUPySOQiiy7
         CP033aFAnrHrRvdErPKBuSxdeUr/9oty5e7L3wXp0cn8sAcbtpqL5xwQnmOQEb1dW8ge
         UmApdCSsyJsBE1Sy7/ly9i5djjHhmTSaQy/sXJcxpQRX59YrCO31h6p0icGzIvA+l2Wj
         XcV43IwMcLnLIP5TAVSNEjfOJzF90ZxLzfT0N7RRCkWxl9tmHKpmueZxwiHsbInCOp1m
         8lnw==
X-Gm-Message-State: AGi0PuZKyssrsUdLE7OD5sDHC2Apu8pnuY90cqLUzXZkrmzr3zHLnmTP
        ZG8pDYK8GS9p2AKP42I1kYfLlQ==
X-Google-Smtp-Source: APiQypK2bX+tqIpGntcBk1/CwwpnTCfzPu8OVIuVdpAy/314r42K0ZVFzsGT+xEEVrPrBkQ7VCf5XA==
X-Received: by 2002:a05:620a:4f2:: with SMTP id b18mr9768314qkh.433.1586385745928;
        Wed, 08 Apr 2020 15:42:25 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.57.212])
        by smtp.gmail.com with ESMTPSA id x17sm19797204qkb.87.2020.04.08.15.42.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Apr 2020 15:42:25 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1jMJOq-0006Fv-Ln; Wed, 08 Apr 2020 19:42:24 -0300
Date:   Wed, 8 Apr 2020 19:42:24 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Nicolas Pitre <nico@fluxnic.net>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        "David S. Miller" <davem@davemloft.net>,
        Saeed Mahameed <saeedm@mellanox.com>,
        Leon Romanovsky <leon@kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Networking <netdev@vger.kernel.org>,
        linux-rdma <linux-rdma@vger.kernel.org>
Subject: Re: [RFC 0/6] Regressions for "imply" behavior change
Message-ID: <20200408224224.GD11886@ziepe.ca>
References: <20200408202711.1198966-1-arnd@arndb.de>
 <nycvar.YSQ.7.76.2004081633260.2671@knanqh.ubzr>
 <CAK8P3a2frDf4BzEpEF0uwPTV2dv6Jve+6N97z1sSuSBUAPJquA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a2frDf4BzEpEF0uwPTV2dv6Jve+6N97z1sSuSBUAPJquA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Apr 08, 2020 at 10:49:48PM +0200, Arnd Bergmann wrote:
> On Wed, Apr 8, 2020 at 10:38 PM Nicolas Pitre <nico@fluxnic.net> wrote:
> > On Wed, 8 Apr 2020, Arnd Bergmann wrote:
> > > I have created workarounds for the Kconfig files, which now stop using
> > > imply and do something else in each case. I don't know whether there was
> > > a bug in the kconfig changes that has led to allowing configurations that
> > > were not meant to be legal even with the new semantics, or if the Kconfig
> > > files have simply become incorrect now and the tool works as expected.
> >
> > In most cases it is the code that has to be fixed. It typically does:
> >
> >         if (IS_ENABLED(CONFIG_FOO))
> >                 foo_init();
> >
> > Where it should rather do:
> >
> >         if (IS_REACHABLE(CONFIG_FOO))
> >                 foo_init();
> >
> > A couple of such patches have been produced and queued in their
> > respective trees already.
> 
> I try to use IS_REACHABLE() only as a last resort, as it tends to
> confuse users when a subsystem is built as a module and already
> loaded but something relying on that subsystem does not use it.
> 
> In the six patches I made, I had to use IS_REACHABLE() once,
> for the others I tended to use a Kconfig dependency like
> 
> 'depends on FOO || FOO=n'

It is unfortunate kconfig doesn't have a language feature for this
idiom, as the above is confounding without a lot of kconfig knowledge

> I did come up with the IS_REACHABLE() macro originally, but that
> doesn't mean I think it's a good idea to use it liberally ;-)

It would be nice to have some uniform policy here

I also don't like the IS_REACHABLE solution, it makes this more
complicated, not less..

Jason
