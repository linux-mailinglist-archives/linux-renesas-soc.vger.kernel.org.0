Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35F8720AEF6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jun 2020 11:27:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726378AbgFZJ1z (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 Jun 2020 05:27:55 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:43978 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726070AbgFZJ1z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Jun 2020 05:27:55 -0400
Received: by mail-ot1-f65.google.com with SMTP id u23so7984748otq.10
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Jun 2020 02:27:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B8Bqx1LoNUWLg8jfC0kYfjKzFkFX20tfwXbh1PPK/RY=;
        b=udSuIwle4Gij7699QMBGl5viHcnvHNS6G2J4/2bmrvoLbZR2FNfjttJ4hh8hIYPEbA
         5YJhvpH8viLnPrnf7QLf4aKPh5YcyKTohZrXoYfMXahPADK/lxNzugnLjiB9zSJVX+HA
         5C2EDsxJzRX6Bsd1uETNTAbblxSfVuCI2xDUaVq5UU6RwTOZidLydJm/u/b+m7WWTGfz
         W6CjilHjsyBqISgCDLe8xKhx0H9yexsWmbhmzoQLnxaQzbFfwTbHmla0iObcXDRIqFuY
         GOfUvfsUmTQkUmpYT3XLegC3dfFcaw6oejE6qg30HCQ6x70fuR99KXt30zJ1xglrgoVw
         wFYg==
X-Gm-Message-State: AOAM532yMIR3apADnWOhvwD40zuVXROLUwx8ZYX6WvoG2h3A8L+LDg2U
        GeRXj+dFDmepV8l/tepM+oYkwKj+4KDCsCmedyM=
X-Google-Smtp-Source: ABdhPJy+DvSso2DfpRyLdU5ja5xoXVjx4FbKbdyM5W9CNjiFPKmX/R4KJB9BZDUhutROv+3P3WmVAYa+H2Z+lhd+qv0=
X-Received: by 2002:a9d:2646:: with SMTP id a64mr1495153otb.107.1593163674225;
 Fri, 26 Jun 2020 02:27:54 -0700 (PDT)
MIME-Version: 1.0
References: <1591874021-10209-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1591874021-10209-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 26 Jun 2020 11:27:43 +0200
Message-ID: <CAMuHMdUOj61YvUVD9dumLGZya+upqqahJrHxKayP2nXZPJNgkQ@mail.gmail.com>
Subject: Re: [PATCH/RFC] arm64: dts: renesas: r8a77961: add IPMMU nodes
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jun 11, 2020 at 1:13 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Add IPMMU nodes for r8a77961 (R-Car M3-W+).
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.9.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
