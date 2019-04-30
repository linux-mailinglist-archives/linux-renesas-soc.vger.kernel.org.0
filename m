Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93E58F993
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Apr 2019 15:10:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727138AbfD3NKp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Apr 2019 09:10:45 -0400
Received: from mail-vk1-f196.google.com ([209.85.221.196]:38759 "EHLO
        mail-vk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726264AbfD3NKp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Apr 2019 09:10:45 -0400
Received: by mail-vk1-f196.google.com with SMTP id h17so79714vke.5;
        Tue, 30 Apr 2019 06:10:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ko5CHzBEBJvqvIpOZVPMxOzlrDQdkG4QFjuTFqoup+Y=;
        b=iq+ucJ8fMSERhx5sf0mTv18i3XzGQ+d9iPIy7fEMLsNzCA4ojGiLa2swul7q7n2xb+
         kvRYFX3LbUVWiZ5ACXG4Dqno+8HJl+hssEqnUwr8azB9i5rj3yoDcaBXsUEZCSBMezOI
         +YLEpLydBrQhoMtzAPlZIeObe+ho+5c6dKpqh3/gTmJncomv51nUAuuzFE9twfy6whnp
         pYWuUCwDrk903j0SnXHtO7lNtNNSVGIy2DyVDT4DA+HEtX4vMcVpx3fkrWunM6fh2Y/K
         Jb4pQPNAPVX04pDpFRT6aOLq4J4ULhC1K6q0JYiCQsmDpRa0OtAcTPePHzM/BfeqmB36
         RSUA==
X-Gm-Message-State: APjAAAUaMikH74CUzD2GaY7sKVckkWYxRuM1zbq1Dfy0spyFXWD6WjfO
        6CHtPpEuHwdtW1QFJArd6VWZtVGFPZmC8YWfSPs=
X-Google-Smtp-Source: APXvYqx+5n8ZYAjVzk8kyd9Kns3I0wjC++2NNS/1lmdOKeKWpr922IOmzYvyJr7TcC31NYHxLa7yofHq87HaRT4Kgzc=
X-Received: by 2002:a1f:1284:: with SMTP id 126mr35442947vks.72.1556629843934;
 Tue, 30 Apr 2019 06:10:43 -0700 (PDT)
MIME-Version: 1.0
References: <1555428717-18376-1-git-send-email-biju.das@bp.renesas.com> <1555428717-18376-7-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1555428717-18376-7-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 30 Apr 2019 15:10:32 +0200
Message-ID: <CAMuHMdXQ1R2xBY2sVeBcKF56+jxFMz08cqva1VkkUGQuzFuV1g@mail.gmail.com>
Subject: Re: [PATCH 6/6] arm64: dts: renesas: r8a774a1: Connect Ethernet-AVB
 to IPMMU-DS0
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Apr 16, 2019 at 5:38 PM Biju Das <biju.das@bp.renesas.com> wrote:
> Add IPMMU-DS0 to the Ethernet-AVB device node.
>
> Based on work by Magnus Damm for the r8a7795.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
