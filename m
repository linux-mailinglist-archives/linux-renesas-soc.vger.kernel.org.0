Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F9712DF7BD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Dec 2020 03:54:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725935AbgLUCxy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 20 Dec 2020 21:53:54 -0500
Received: from mail-lf1-f52.google.com ([209.85.167.52]:42674 "EHLO
        mail-lf1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725902AbgLUCxy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 20 Dec 2020 21:53:54 -0500
Received: by mail-lf1-f52.google.com with SMTP id b26so10626796lff.9
        for <linux-renesas-soc@vger.kernel.org>; Sun, 20 Dec 2020 18:53:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xCNFr4f3wVLInkwunk0vPKzuNbBepmIVeNw0P+U3M9A=;
        b=mPx4N1r3hH6RPSlBIymxtBc0cHodMt5J/O4pw9gxVOYbywIsGh7M+dE0zb4HPQ+lmC
         vT/BJ+R2M/uwUAUYBHPg4hxYeMKAF5o3B7GKXJFvfTqsYtSSB7bNbPv8ajFpymMbjC7P
         VhEc40OCd97uZb/bppQ/3Dg2NwQ6aYVkeURsdGZuezalJwPWdPw6JmMd2r40TWKowwWq
         nJL+9rAP4KWNTHx1qQ+LkGfbnM7HRuAUsB33+sMTHZS7Xow6rflcXc67/gTHEZ+GFqp+
         Yr7yM445Bt8UZrushISPdaRlGVPE73dhM+gjY3bKA7HxZLGSbSzT1ySP+3XJMjksDCnY
         kFKQ==
X-Gm-Message-State: AOAM530Ku/Xx4htdei13lD93cul+1QzpR9/1KY/nLyzCQPun6FvlbRHV
        7weBb5x64aVyKErihaE1FPicBI4uTFU/wA==
X-Google-Smtp-Source: ABdhPJxCgWALvl0dmCVJFXZIIp6LZuK1nbtklJixIHb6BZVnNtXB+i+Q4KrEaZJo4/zbwvxv+it7yQ==
X-Received: by 2002:a19:7f46:: with SMTP id a67mr6025797lfd.514.1608519191443;
        Sun, 20 Dec 2020 18:53:11 -0800 (PST)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id q21sm1884560lfc.290.2020.12.20.18.53.10
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Dec 2020 18:53:10 -0800 (PST)
Received: by mail-lf1-f50.google.com with SMTP id o19so20223590lfo.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 20 Dec 2020 18:53:10 -0800 (PST)
X-Received: by 2002:a2e:8e62:: with SMTP id t2mr6426100ljk.463.1608519190106;
 Sun, 20 Dec 2020 18:53:10 -0800 (PST)
MIME-Version: 1.0
References: <20201220195005.26438-1-laurent.pinchart+renesas@ideasonboard.com> <20201220195005.26438-6-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20201220195005.26438-6-laurent.pinchart+renesas@ideasonboard.com>
From:   Chen-Yu Tsai <wens@csie.org>
Date:   Mon, 21 Dec 2020 10:52:58 +0800
X-Gmail-Original-Message-ID: <CAGb2v65F+g7YZE5rbOJK2eNztu_EvhO2V3Vz-nUA+AxT55qsRA@mail.gmail.com>
Message-ID: <CAGb2v65F+g7YZE5rbOJK2eNztu_EvhO2V3Vz-nUA+AxT55qsRA@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] dt-bindings: display: sun8i-a83t-dw-hdmi:
 Reference dw-hdmi YAML schema
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sandy Huang <hjc@rock-chips.com>,
        "open list:ARM/SHMOBILE ARM..." <linux-renesas-soc@vger.kernel.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Mark Yao <mark.yao@rock-chips.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Dec 21, 2020 at 4:03 AM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
>
> Replace the reference to the DWC HDMI text DT binding with a reference
> to the YAML equivalent.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Acked-by: Rob Herring <robh@kernel.org>

Acked-by: Chen-Yu Tsai <wens@csie.org>
