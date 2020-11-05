Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BFBD2A7BE6
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Nov 2020 11:34:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726715AbgKEKeQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 5 Nov 2020 05:34:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725827AbgKEKeQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Nov 2020 05:34:16 -0500
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com [IPv6:2607:f8b0:4864:20::b42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 160A3C0613CF;
        Thu,  5 Nov 2020 02:34:16 -0800 (PST)
Received: by mail-yb1-xb42.google.com with SMTP id i186so893406ybc.11;
        Thu, 05 Nov 2020 02:34:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DNYuFU0GD0dcUQBqtp/+tmf7wl9kqn5LLBU1iSOy5n0=;
        b=qGbsefdd+w8Px17CuPflxV0d6gFCZ6+2AT+D7vjxSGQKhGPUaB/cGV22+6jhsPAQUC
         pSB8JOS1fmrrKB0VK4iDj+sBuGClNtrSwHvogD2AcKyrmXnxa2hzkkY+O1+cnhv/NCBE
         59wIl8btskTDnaUokQ4rASegnQQcZg7Q8V3W+sTZRv11wq5H7i4MxCTRREvQmbXg+TBa
         CQK5YrZ1eidQIJCmj7UW5Xinckq1PQRPsTzeE7FVOlU2GT7cLFV/jocf2sR3CLWlHda3
         uhq5KXWoF9MihYGifVSVVrb/0MDgbDx87b23rVxhjaAxL7PtJJgDlTQTnfgzNeFoxIjK
         fpCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DNYuFU0GD0dcUQBqtp/+tmf7wl9kqn5LLBU1iSOy5n0=;
        b=EcRRbCyu03DdLTJz+QxYs2mLlHY3uiWtyBWyo/2kmuVYLeODTE7cPk+r5+X/Xkn2kK
         B86vSUZwip8bv1GHKv/soQ501nu1T04ty3KNVcu3hEjqlZhumEtkVNpeDAVr1CGEqNCw
         L0wlC8vmVSsylATCq941FblUTRCt5aYikN5T4OdE5CgDaK9NTtl0eyBptxu9iCc8zbie
         d/+XqYxnA/uoiMPunon01hLzT+EJEy7ULU8zETq6DO0iou7JOZZRjzXqp4bgWYApsknN
         nhFc4c8apDq5w1suHE8iG6DruVatfZ4I4D5oo2DPBUO6UXdVuVoCv+xdlSjxffsGa2EU
         agNA==
X-Gm-Message-State: AOAM531JBe6YGZVERRbIeazgXU/4dKwY2ExuAKCGuTQvQd1yOxWzvaBQ
        txB5ceYuA09G8gSqDMHOkWhJUziasvUU5g/5pABFQtUWYH8=
X-Google-Smtp-Source: ABdhPJyXG4Obojla9+xSE8BY0bWQEGq5peXmisrmc0L/wogYx8CEbS+YgsgRsw6gWe0Tf1NJGRFGkvlagQF41sdgFtI=
X-Received: by 2002:a25:b316:: with SMTP id l22mr2488154ybj.395.1604572455376;
 Thu, 05 Nov 2020 02:34:15 -0800 (PST)
MIME-Version: 1.0
References: <20200921072206.15182-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20200921072206.15182-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Thu, 5 Nov 2020 10:33:49 +0000
Message-ID: <CA+V-a8th6J_jTb53GfYcYUftuc5NJpw8m6YxoD64tvvmLTiJew@mail.gmail.com>
Subject: Re: [RESEND PATCH] dt-bindings: ata: renesas,rcar-sata: Add r8a774e1 support
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-ide@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jens,

On Mon, Sep 21, 2020 at 8:22 AM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
>
> Document SATA support for the RZ/G2H, no driver change required.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Hi All,
>
> This patch is part of series [1] (orignal patch [2]) where rest of the
> patches have been picked up by the respective maintainers so just
> resending this patch.
>
> I have included the Acks' from the maintainers.
>
> [1] https://patchwork.kernel.org/project/linux-renesas-soc/
>     list/?series=319563
> [2] https://patchwork.kernel.org/patch/11668061/
>
> Cheers,
> Prabhakar
> ---
>  Documentation/devicetree/bindings/ata/renesas,rcar-sata.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
This patch is not in mainline yet (first version was posted in July).
Let me know if you want me to re-send it.

Cheers,
Prabhakar
