Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D42001F1A58
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jun 2020 15:49:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729543AbgFHNtk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Jun 2020 09:49:40 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:33334 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729051AbgFHNtk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Jun 2020 09:49:40 -0400
Received: by mail-ot1-f68.google.com with SMTP id n6so4319296otl.0;
        Mon, 08 Jun 2020 06:49:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vE39FsAHEzS4nlgN+9+kwQFUunfNcIp+asj1pK6LsSA=;
        b=UDvq0ADbA9s1c1QDythwQEyISVMLMrl8PpO8mVoL/rLRhB7w9RQZ7HdGc5XjPw44V0
         MX9x8S7NTA8rP09KAdBeGP9IXekXFxVN01TzD/SBajfrKzXwC4SFrkutt/nimdAvTLHU
         berPo/9OjOr3mslDiZjG1nSftFDhUF9fzhk7f9Sb8Zm5oLqTO4wCp0AzKxG9+CQc/gJk
         oUonLhPm8+YvvcSc0B6l/qVGhaUsQFlpvTi6YmFvTPBEhsG2xPXUxA7uJFWUi0JRe0zM
         6Ov8AwoZdyzcZshlqn5LrJplcEGLLChsOBJ+VmklKVAJ6V705ZiCMX98zukfccbQHjN+
         mBQA==
X-Gm-Message-State: AOAM532WNfWRKm+8T60+bmXHdKCCJv4bjxv/u1DBLRLFEgFIFbIArkz9
        ZgvGTzII4SjE3Um4UQjWp6mnuHdCANXX+0qDSC+R8A==
X-Google-Smtp-Source: ABdhPJzrpsaHVulgjeel/2KAtDHbnuBIT+dYk9JWN0/9nspbGEIkFKUO/9zqOstvoXxWfyptUtPaaXqLx8mot6VJEVE=
X-Received: by 2002:a9d:62c2:: with SMTP id z2mr17279541otk.145.1591624178388;
 Mon, 08 Jun 2020 06:49:38 -0700 (PDT)
MIME-Version: 1.0
References: <1591555267-21822-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1591555267-21822-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 8 Jun 2020 15:49:26 +0200
Message-ID: <CAMuHMdVgL6VOU3oxjtpCc=oQTfpsz3LXxm6cHK-V5N-46HMrVQ@mail.gmail.com>
Subject: Re: [PATCH 01/11] arm64: dts: renesas: r8a774a1-hihope-rzg2m[-ex/-ex-idk-1110wr]:
 Rename HiHope RZ/G2M boards
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, Jun 7, 2020 at 8:41 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> The existing DTS files for HiHope RZ/G2M boards are for Rev.2.0 version
> so reflect the same for the DTS file names so that the existing naming
> convention can be used for Rev.3.0/4.0 boards.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
