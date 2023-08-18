Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 143077807BE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Aug 2023 11:02:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358870AbjHRJCW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Aug 2023 05:02:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358900AbjHRJBz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Aug 2023 05:01:55 -0400
X-Greylist: delayed 1507 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 18 Aug 2023 02:01:32 PDT
Received: from mail.leachkin.pl (mail.leachkin.pl [217.61.97.203])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BE84422C
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Aug 2023 02:01:32 -0700 (PDT)
Received: by mail.leachkin.pl (Postfix, from userid 1001)
        id 594CE84089; Fri, 18 Aug 2023 09:16:03 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leachkin.pl; s=mail;
        t=1692346568; bh=elHzctRz/z3PfTIhGYJKd0TeBTmca98Y+JNgX4gfsPI=;
        h=Date:From:To:Subject:From;
        b=DX/MXa3kBV7T7QrOhvyQ89YyYoiMBPnpD7YAdhy7QOcDe5XviCAcpCpPBRXy4Gdlm
         vf1ZYhOr51S9E77Z/Pb7oZ1uDMLHZ1j0Gnx8ewrnNyFFEDgt8ZVnChmYENBRGax2x1
         UgK7AljwXBpXkJPF2Q0xa1bm8XENfqxSPiicaBA5M/y97hm6xtNhgTTgXDitx/ymET
         UxrWE7m/LR1sqc+/QlDZZyG8xXzguuFUMMScQsWkQj+L6ka/CIWEV2LFoOQXuRpIDJ
         fbTP6r5MoBNJAuMBGmJiUEgUTXgyePib5hDWWq180Cj16wgt8VAgUKmaT/QHKJPUPm
         oREm9Nk+au1TQ==
Received: by mail.leachkin.pl for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Aug 2023 08:15:51 GMT
Message-ID: <20230818074501-0.1.4u.ctuj.0.bpn13zl6l2@leachkin.pl>
Date:   Fri, 18 Aug 2023 08:15:51 GMT
From:   "Jakub Lemczak" <jakub.lemczak@leachkin.pl>
To:     <linux-renesas-soc@vger.kernel.org>
Subject: =?UTF-8?Q?Pytanie_o_samoch=C3=B3d?=
X-Mailer: mail.leachkin.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=1.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_VALIDITY_RPBL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Dzie=C5=84 dobry,

Czy interesuje Pa=C5=84stwa rozwi=C4=85zanie umo=C5=BCliwiaj=C4=85ce moni=
torowanie samochod=C3=B3w firmowych oraz optymalizacj=C4=99 koszt=C3=B3w =
ich utrzymania?=20


Pozdrawiam,
Jakub Lemczak
