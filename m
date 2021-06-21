Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F234E3AED14
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Jun 2021 18:05:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230299AbhFUQHm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Jun 2021 12:07:42 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:58721 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230269AbhFUQHm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Jun 2021 12:07:42 -0400
Received: from [192.168.1.155] ([95.118.106.223]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MZkYx-1lk6xC1s2h-00WmrM; Mon, 21 Jun 2021 18:05:13 +0200
Subject: Re: [PATH 0/4] [RFC] Support virtual DRM
To:     Tomohito Esaki <etom@igel.co.jp>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     dri-devlel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org
References: <20210621062742.26073-1-etom@igel.co.jp>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <7cde82a9-c60c-e527-eeac-eaad0c5842a1@metux.net>
Date:   Mon, 21 Jun 2021 18:05:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210621062742.26073-1-etom@igel.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ZbI1RWxgocInH9UAHR6iDpdy/HJfu+bSz9Z2X6RE6gibrXly73l
 jgZ0HUAoSMsj7eoB5ficazIKQQImXBnqqX2nwA5iCta+OFxwBSPp+g3pewEOIcOyXuIuow8
 014MAuba7Mrjwdeg9uyraO9/kmwtPM9bgTed9LHI0YvjIEILWKw2mbLTS+TKbsirguCmb1l
 Pc7g9+dSHBO6o7BUd964w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:9n13vlzoNqk=:aRYaqiT6BrZI+UguW1PoVs
 uKEvRY4VdRhJ1AGsObSRE0Zio4gd5xjOcoZp8/i3dgG9mTVi1BaP4Hr3hl2kYHzyiWnU3h7lq
 f3vuhAIWUEmLCcUvTjpmis93jBwALK+Cy4+iwe54TuXQgWy3RkMwzaNOW2vfNLuRR2V81G+MW
 wJqjlRYzpj0PPgbUPbxv2tuGB3t8+Bw7P3FUOBx/t5PITs9rIl9In/EJ7b6BXUD7/8CyHT0H5
 8CAEQvPZBolbeQB2Fw03q47wkUlSNUhbyR2Y9zqfTwiPhXKAPQ3EWmkEJNlC/L4ohbVYQdWFt
 dq2thHVhGplX2hxpFXV66AHWvqa4XlQY3XBSfID9NzEgBOFCzrSQ6r13gdRoJtmLGp7ioGsfJ
 X3WJLozX3qXwyPr+5shDb5FE3XFfWv53mbXRC1dGlAOeVD4+w3QQnPoaQEf0NB1MIWP85UgNT
 4HtMcAcK1u/txzMFb2mNGcSrUBn25NaH7N32DK/f0anyPmd6sZLrEEC3n7MQSfvlK1d2lOIWx
 kcFLj+HgeTtJuk6HyEnm2Y=
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 21.06.21 08:27, Tomohito Esaki wrote:

Hi,

> Virtual DRM splits the overlay planes of a display controller into multiple
> virtual devices to allow each plane to be accessed by each process.
> 
> This makes it possible to overlay images output from multiple processes on a
> display. For example, one process displays the camera image without compositor
> while another process overlays the UI.

Are you attempting to create an simple in-kernel compositor ?

I don't think that's not the way to go, at least not by touching each
single display driver, and not hardcoding the planes in DT.

What's the actual use case you're doing that for ? Why not using some
userland compositor ?

If you really wanna build a kernel compositor, it should be completely
independent of hw drivers. (well, almost - in case of gpus shall be
used, the commands obviously need to be dispatched the actual driver)


--mtx

-- 
---
Hinweis: unverschlüsselte E-Mails können leicht abgehört und manipuliert
werden ! Für eine vertrauliche Kommunikation senden Sie bitte ihren
GPG/PGP-Schlüssel zu.
---
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
