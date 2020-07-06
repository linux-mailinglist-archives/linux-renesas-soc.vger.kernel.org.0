Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5394F2159B8
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jul 2020 16:37:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729193AbgGFOhF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Jul 2020 10:37:05 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:59333 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729148AbgGFOhE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Jul 2020 10:37:04 -0400
Received: from mail-qv1-f46.google.com ([209.85.219.46]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MGR3r-1k8d8c11Tx-00GmOt for <linux-renesas-soc@vger.kernel.org>; Mon, 06
 Jul 2020 16:37:03 +0200
Received: by mail-qv1-f46.google.com with SMTP id e3so10948932qvo.10
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Jul 2020 07:37:03 -0700 (PDT)
X-Gm-Message-State: AOAM532rnvA3zKe0qAA8Lp2oif+atcLOpuilXVfxFHzaV0P2CCODWJpD
        XAI4m7TSgmjA3cVSGJ+V8bV3YyGv8wLIbAa7Wqg=
X-Google-Smtp-Source: ABdhPJzb4vc/KIsQewDha5f6age/2aoU9Z4ftKMYp986EdyUdqLsue/vgbkSVrJkNgTWUMOm2Qb8AjhqU0fYM+pz3DA=
X-Received: by 2002:a0c:a992:: with SMTP id a18mr36746711qvb.211.1594046222180;
 Mon, 06 Jul 2020 07:37:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200703120642.5128-1-geert+renesas@glider.be> <20200703120642.5128-2-geert+renesas@glider.be>
In-Reply-To: <20200703120642.5128-2-geert+renesas@glider.be>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 6 Jul 2020 16:36:46 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0GTf-NBAixvgefyvx_nRpLgYZ6gZdp_VAUNTOV2=+t0g@mail.gmail.com>
Message-ID: <CAK8P3a0GTf-NBAixvgefyvx_nRpLgYZ6gZdp_VAUNTOV2=+t0g@mail.gmail.com>
Subject: Re: [GIT PULL 1/2] Renesas ARM defconfig updates for v5.9
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:znOV++QT2c/5xePNyB3Zu0JtjowQem+CZ/Lck+atjyg2hOziAMV
 /EPo0QbSugEO05YMMu9GQ+UGxadsukEdLuFbe4Z49zT7l6WM8YQ7x8uGsjKmVemXXMWvIqB
 OfNONSQEAkw43LgcvWX4QF0Y3ahv91kQPYcSIHxMHNi9nCJuuABNuEXYGkOh8dPXRhASqsR
 CE/vOLnnJUL8kDuDmegvg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:0SZ8GMECmoI=:3CVe/xIGUZjOF7MSp5akVY
 bP11GXsEGGjZbiBoUqJ0n1QuMYKKznd64Dj178LNc/54g5X25xGLwFHocv2XXABX/W0A3pDli
 E7KhHbt6RcHy7cnRJg4tuPr30hQbfoGkY0No5Ka3IKiDf7f2+lavMdl4ahwbKVf0A7FcHgLCG
 GcyWg3yosB75LlNmeYJhfXUtcqfkfmCSxtL98b/fN50uhObUU+6s4H125OrKJpaxbMGQFOA1+
 TyfEagqibu7ssL/qHKE1iUV5sgmwTNO89S+2GjBPg3iCm6shoro/eju3yxgE9gx5RQKWJR/97
 omgjqBY1hxy98i2UCEcPVrvNwyd4qqb4SFYZ6wl723RZ8/VS7CADsurErBYa6AqvwSTWNdml0
 8Scr7JgWuLpmZwrYWDcPeK3wRpt/OwjgxiUjx6X+FW9dZkfeb4qX7QByEIVUhKjFg7ubY8AWc
 aGPnx5iI7VczQmkk2tlhqg2Y/NVBZFszJ5dm5/C7oFVYCPKwMnjwgiy16q6bKRukoj8T8NEG1
 9AeIvL6aw5PU+Dq3Qg1F15fQM9SQWnSHRbyf/Zxpk+4LvVYrSSZnxXyfNw5iW+MKvgKagZjEB
 AAcT4dv9Kf3+s3D09OrX93QeQQ7T5qSHjGnWeIFNq9LUInJOybN1nYfKxHfd1QDCds7qLj31H
 5nvsSes9qC7peTau/GpphHKubZfpJ4SK6XgNJ7oFIE+BNCHDXnH72I9ALhBs2+aQMCXPVslL3
 d/4LkZpiPs3jvGyoW4b27UfNDFoBIel7xwHhlfvjZqXPncpumxHI6Uk7j/BM33cVEED+1xm6+
 FMYdc5/CnRTGD10uPANd0Req78lEd9iuA/Nh+pqH+XBpw9UGkpPA+QyZKifnJxV3kEtEl5D
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jul 3, 2020 at 2:07 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> ----------------------------------------------------------------
> Renesas ARM defconfig updates for v5.9
>
>   - Refresh shmobile_defconfig for v5.8-rc1
>   - Enable additional support for Renesas platforms to
>     shmobile_defconfig, multi_v7_defconfig, and the arm64 defconfig.
>

As you write on one of the commits

   "All of the above are modular, except for Ethernet support (HDMI Audio
    support is an optional feature of the modular ADV7511 driver)."

I'm starting to see some demand for making more drivers loadable modules
that are traditionally built-in. Can you give a more specific reason why
this one (and I guess CONFIG_RAVB next to it) should not a loadable module?

        Arnd
