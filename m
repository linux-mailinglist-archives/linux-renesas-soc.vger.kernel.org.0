Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B736223DCB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Jul 2020 16:09:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728164AbgGQOIM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Jul 2020 10:08:12 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:51727 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728157AbgGQOIL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Jul 2020 10:08:11 -0400
Received: from mail-qk1-f175.google.com ([209.85.222.175]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1N0o3X-1kjZkK1trh-00wqKJ for <linux-renesas-soc@vger.kernel.org>; Fri, 17
 Jul 2020 16:08:09 +0200
Received: by mail-qk1-f175.google.com with SMTP id b185so8842656qkg.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Jul 2020 07:08:09 -0700 (PDT)
X-Gm-Message-State: AOAM530Ljrc+ntCEmKSFte3Ap4P7BKG0jqCZeqJk90j1BR+ltFIcKE25
        +xzJpNqboOEhy9OJdjP0JVZlfhMEzzotCjFJyWU=
X-Google-Smtp-Source: ABdhPJyqUAMfYLNF3G1Iv/bLnBjjErYJ5iEcQ613oZrD+RyUfUUaZAZdS7nW7aqCVYRt/A6saJcifx23F8M9LfdVs5U=
X-Received: by 2002:a05:620a:2444:: with SMTP id h4mr890029qkn.352.1594994888352;
 Fri, 17 Jul 2020 07:08:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200717112427.26032-1-geert+renesas@glider.be>
In-Reply-To: <20200717112427.26032-1-geert+renesas@glider.be>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 17 Jul 2020 16:07:52 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2yyef4+kaKgtiC4tfugDEqay6gDUzfTwORLAku1j+T8A@mail.gmail.com>
Message-ID: <CAK8P3a2yyef4+kaKgtiC4tfugDEqay6gDUzfTwORLAku1j+T8A@mail.gmail.com>
Subject: Re: [GIT PULL 0/3] Renesas ARM SoC updates for v5.9 (take two)
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:h5YYUorSAvfeLGvRD5+RP+kq7xN5J9NbvcZOkT+mAAlStFn48P0
 LuV98oiCuqS1XOi5wX6DlfdFMYTwz8CXJMLkYD+M948t6L/F+8rNZ0h8FPkRlFr64czuX2j
 ata+Iqzvf1+s7RKgS/DnTJFsaA36uz2usiDThD2U4p8rAhXkqWghaVWHxc5x2S0hihJYlZ7
 tf/JlwK/6RYQwQ6rF42ZQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:IvOodUIa/8w=:S/ijjz1ySDiAfrvspgz8MS
 yHCzXqdGUKCLD+3W//NY/q/voOLmA55slBjbIbKxZ6sR0+hK4RD19mUUcipZY6XB43ji2Wi7v
 mk90HsqYZV6LoqI7r2jOGy41lwAQoDGO1q0INtChAHK36yu1Z/unMkOAE8+DC0ceTfAl36AgC
 awgmC3M/hXtAvInXQ7pNU/zCVsOcd+poA+o5DwogFPIaHtbhFq1DtK/ujtJMZNZiuUvDhTmA4
 hE0vdjwC5BiV3habvrBgx/JOGU081ruipFR8GCub8Mc25QZIAQqcF8VB/nZpFK7Qy2jvjC8s2
 zAbmmo5s4OeZauukSYsGGnZL6DDIE/gOtMSgZspIv6/gj8FIBODG/wG8d+M5Y5OD23p5SDTdn
 VqBMnXKi6qj1BZNK+6Bg9ZYcE5VBOAmSwed3DOh05M5aT5jzZpgSp9YnVSUfYW0ORE8/LNb9Y
 oWHnjckRXJcO8njRyBKzAd9x2quB2JVacJy3DdVK03hFH+q2AtwAyzeCBJH5EnTn2sH5+Sqwn
 3keAzIOwyUWs+UbQllJ06qZTXUHVwcPO0RyBkj6eDGDnh3MbKJO90eBlPDCQOsXXEqpTpNABV
 4FPyYNvxR0jcAWowAnPXb/vXVxKfXrw8vp6GnOtj3N4QqABWt7FsBL3UKx5ROMsZUmeRW+nyp
 dxAreVkdyyBv+nq+Gw48h7XfJV5qpD47Euixyo44Nh3cXLcaW/UL0MDhXGSKp1xI7wmxu0d8h
 zsCJM8vMzK1Zfb+CJ77+zJCh1Rfj4Wq4fjJaWBBA7IiabZVuDongT66K10OHCeYw1By4vD917
 yJ3lyrlunjfbpPx++LGIaDvdtYpbnNqVnLDkB/rQHLankrB43khhjiER+KDGxrNlsAq9+tnoK
 WPpCoYbSrye1fxCSjY+ftwYKtPiD9Q9vYJ3MUJHeADRkIU+fVSEh/+hOgQt/WOdnkACMAPs1b
 7ntheDc857coOBBs/Mp/IGVXSJdiEErcJNuow+YK1acEfefy9I86E
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jul 17, 2020 at 1:24 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
>         Hi arm-soc folks,
>
> This is my second pull request for the inclusion of Renesas SoC updates
> for v5.9.
>
> It consists of 3 parts:

Pulled all three, thanks!

      Arnd
