Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5CC5250B90
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Aug 2020 00:21:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726551AbgHXWVC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Aug 2020 18:21:02 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:43856 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726532AbgHXWVC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Aug 2020 18:21:02 -0400
Received: by mail-io1-f65.google.com with SMTP id s1so10436650iot.10;
        Mon, 24 Aug 2020 15:21:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yNRaJJrYT3TI0Gn7ip8sjaITsBSuW5Cvw4IVR3Hv6/g=;
        b=gyrAFVEVcugIG5Y+MU1acK2ZqmtXWQ0pFZ0ntNoiczzgXNmRUvf6CJ5gZk0sLpOpQ6
         Z7xEqlg0OvFd9h54foZ6X7mfEjPFovIiQKzZSU8A9z3ry46bvhu3E15chvpsJNNBYinj
         HtlmiBEEkqKrKbyaxhsYzqmQEUaPWP15xwTNdQF9XVrSe7t4Q+Nfa0+TSj9q5EW/V7ET
         iCkoTnPqwCBX/TjelLwvGCxJsIO/rmE0U55YvSRwIVvjaorD4csnKaOrRjxoYJ0yEEsc
         FnkQn/VRus+1lxBo58CkEsP+i8zldnB+D5qjABI5atZtWVTe0AfNeGzb+qIJxMpW4E5V
         zbjw==
X-Gm-Message-State: AOAM533LvwucYK2B/bGHLnkFowTEPQd2h33GdM3EC88vlqa/xN54fqd2
        onrFyu1BnbRTlLQQHqCazw==
X-Google-Smtp-Source: ABdhPJzP+zFgUKjKzI1NzjFpqZdYm2HRbVENE0AOJP8z+QU/enk/3cg6PZWntQ60QQA9C0gJaqckig==
X-Received: by 2002:a5d:8a0d:: with SMTP id w13mr1101710iod.13.1598307661073;
        Mon, 24 Aug 2020 15:21:01 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id w7sm7933293ilo.17.2020.08.24.15.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2020 15:21:00 -0700 (PDT)
Received: (nullmailer pid 3421572 invoked by uid 1000);
        Mon, 24 Aug 2020 22:20:58 -0000
Date:   Mon, 24 Aug 2020 16:20:58 -0600
From:   Rob Herring <robh@kernel.org>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     David Airlie <airlied@linux.ie>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 3/7] dt-bindings: display: renesas, lvds: Document
 r8a7742 bindings
Message-ID: <20200824222058.GA3421514@bogus>
References: <20200807174954.14448-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200807174954.14448-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200807174954.14448-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, 07 Aug 2020 18:49:50 +0100, Lad Prabhakar wrote:
> Document the RZ/G1H (R8A7742) LVDS bindings.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> ---
>  .../devicetree/bindings/display/bridge/renesas,lvds.txt          | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
