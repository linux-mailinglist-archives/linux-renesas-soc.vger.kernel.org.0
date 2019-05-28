Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB25C2CB9F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 May 2019 18:17:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726736AbfE1QRc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 May 2019 12:17:32 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:43171 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726371AbfE1QRc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 May 2019 12:17:32 -0400
Received: by mail-lf1-f66.google.com with SMTP id u27so15058780lfg.10;
        Tue, 28 May 2019 09:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=0mCOvPTQFt06F/boW4vTUbBF7nJMno4atGIvwcskOpo=;
        b=kj6ZrRo1HJLZsUgUXJnuRb8eNZE1GMLEFbPyLa2GNepvLvteouHbmc4f0/q867Iy38
         V0u7l8xEbnAb/y/urqyqBNkm/sqOs3qjgxGyGBkkQ6ej2RkqaiejUiShHSKN8UQi8SLv
         H3wwPlSOmo+SsSxVgb/hX2F56KYcTW4LaFVpdxT9CmhrnWJqyBR4d+VIAm9fz8PoRzhi
         XlFmyuN0aV2VLYxcHXHialTBfq/0AVa+2ICL7KX/QAiAggqmKugXbgOP3yl+6mKsO2s9
         8vCDMro65rnkazT4LLI0HD03ntEe/CBiCGvhN7FPB3z9rVdnxz6lI0pyH773tnqOFsvi
         oKMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=0mCOvPTQFt06F/boW4vTUbBF7nJMno4atGIvwcskOpo=;
        b=qdwFgCBDqsd5uZHfutJtHGk1yf6m9GSaglSYFlsK3w3ViI7lembLBfspLgbu5oXPaE
         +ouhL4+1ZF0GsMcBuEeQXDm8PlQlaE7KCG4VAADuZWjfLZh7V14hWLcEdi64oKjqFCkS
         XH4PxIPKV/7gvjXJ8rXPDS9TuQw1y66XG7018WgGM+Wehxy5DxQIwK2JZi6NJs+LeC2i
         KBx1equTjE3kA01vCWzznvjC+Pmvjl7nd/ScSU3N69KddIWKrHaPr5KRYBHnSpm/GuXz
         0izna/lThl/7GMd439jmnVerVqOf16BJBS5rjeDsNqrwEp23ZZ9OHS3rYE4mViPt+wRx
         hqRQ==
X-Gm-Message-State: APjAAAWH3GRtBB3AkXC3ZbZONJLbJ3/RwTxnWuROv40pbDPBMntF25ld
        J/lNab5/5QNzaMP1TlCDKYw=
X-Google-Smtp-Source: APXvYqzidImAk0jrnotbs+JaG3aAxRd0IUUyMuMdd3z8pk3Igq9cdLgxNRlfKUbza70ckuuscZ7yxQ==
X-Received: by 2002:a19:6517:: with SMTP id z23mr11104789lfb.98.1559060250080;
        Tue, 28 May 2019 09:17:30 -0700 (PDT)
Received: from [10.17.182.120] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
        by smtp.gmail.com with ESMTPSA id o184sm802131lfo.37.2019.05.28.09.17.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 May 2019 09:17:29 -0700 (PDT)
Subject: Re: [PATCH V5] ARM: mach-shmobile: Don't init CNTVOFF/counter if PSCI
 is available
To:     Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Julien Grall <julien.grall@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <1558087093-22113-1-git-send-email-olekstysh@gmail.com>
 <CAMuHMdVC=aNQTZ0r+7qpiWEyEaoQ587pm1FxhWqR3pwHwv2ARg@mail.gmail.com>
 <20190528160509.5vunuxxxcjduobpb@verge.net.au>
From:   Oleksandr <olekstysh@gmail.com>
Message-ID: <95324d18-651b-4b9c-1016-5d669b1c810a@gmail.com>
Date:   Tue, 28 May 2019 19:17:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190528160509.5vunuxxxcjduobpb@verge.net.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

> Oleksandr, could I trouble you to respin with the
> changes suggested by Geert?

Hi, Simon.

Sure, will send an updated patch tomorrow.


>
-- 
Regards,

Oleksandr Tyshchenko

