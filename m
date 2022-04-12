Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7F104FDB78
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Apr 2022 12:57:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354598AbiDLKEH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Apr 2022 06:04:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351860AbiDLJmd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Apr 2022 05:42:33 -0400
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D735F5006E;
        Tue, 12 Apr 2022 01:49:46 -0700 (PDT)
Received: by mail-qk1-f182.google.com with SMTP id t207so11777739qke.2;
        Tue, 12 Apr 2022 01:49:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HEV75USYeQipOpGCIPsKDQNFk/Kk7zQM9cWBtFpjTOQ=;
        b=VbYxAQz4qhbIQfKmCrm5/Ndr47DxSo7mTseY27gCNQC1iNhAFm9NnCFZDaP45caAaZ
         8cvIbg7eSKKPDpgN3nrsqd+YjTz/u+h2xSX7NL2mjw4JM5D70edIwYd+7r4dmQ/eHlkg
         Pp98E/BiCKtigKwnHw9+EkaSq6eeUa3LBjv9uPMPqTjRyXaCrUvE/+GgMqmTEZ89t3Eg
         f8oaDHpz8qiya0MCpN3OJaHO12+3aI6HTB/W5aHiDhJ2524Febn1pqNqcpAqbz9oMT+s
         n0xoJ5qS6XG3RG9LGED0DGqKpkEgAf9xJZIGjzuufbzw1Ymq5Rh7rtoh3gNIGWu0wxcw
         a0ww==
X-Gm-Message-State: AOAM532Ttv//XnNLb3L6sUkj1nss2IiQYBHwvWomt38+/9qEjP0v9NRj
        Y5OB1jAjOEDx9ghIVmMcjDBFFNlFL8ki+fLf
X-Google-Smtp-Source: ABdhPJxjPdub7r6kUVt+HremPZS73CSGbs+mJU/SOr9e/cqVjaphkkBCU7SyMXkc8hYnsOSz1zwk7Q==
X-Received: by 2002:a37:a914:0:b0:69c:f27:7e4d with SMTP id s20-20020a37a914000000b0069c0f277e4dmr2355413qke.198.1649753385830;
        Tue, 12 Apr 2022 01:49:45 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id d140-20020a376892000000b0069bdd40d852sm7838020qkc.75.2022.04.12.01.49.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Apr 2022 01:49:45 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id x200so8197703ybe.13;
        Tue, 12 Apr 2022 01:49:45 -0700 (PDT)
X-Received: by 2002:a5b:984:0:b0:63f:8c38:676c with SMTP id
 c4-20020a5b0984000000b0063f8c38676cmr15160517ybq.393.1649753385328; Tue, 12
 Apr 2022 01:49:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220322095512.4707-1-wsa+renesas@sang-engineering.com> <20220322095512.4707-5-wsa+renesas@sang-engineering.com>
In-Reply-To: <20220322095512.4707-5-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 12 Apr 2022 10:49:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUx-o9i0YPhoLrPDKh0=MSdMmrpdtgB1O4=i5UK_RfPWg@mail.gmail.com>
Message-ID: <CAMuHMdUx-o9i0YPhoLrPDKh0=MSdMmrpdtgB1O4=i5UK_RfPWg@mail.gmail.com>
Subject: Re: [PATCH 4/5] arm64: dts: renesas: rzg2: add interrupt property to
 the watchdog node
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Mar 22, 2022 at 11:57 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Driver doesn't use it yet, but let's describe the HW properly.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.19.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
