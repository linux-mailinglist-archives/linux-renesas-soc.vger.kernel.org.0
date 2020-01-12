Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63480138AA8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jan 2020 06:20:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725909AbgAMFUj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Jan 2020 00:20:39 -0500
Received: from mail01.vodafone.es ([217.130.24.71]:61170 "EHLO
        mail01.vodafone.es" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725268AbgAMFUj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Jan 2020 00:20:39 -0500
IronPort-SDR: KcEYWxAMY8V9DuvBnMOeFskZx/D9f8EJV20Dmihcn15RJizJ0yAlW5S5jsVnReUn6vkds++m36
 fAHat3DkH9sg==
IronPort-PHdr: =?us-ascii?q?9a23=3AIB4nlBFYZSDetHbdLiE9vp1GYnF86YWxBRYc79?=
 =?us-ascii?q?8ds5kLTJ7yps2wAkXT6L1XgUPTWs2DsrQY0rGQ6f6xEjxaqb+681k6OKRWUB?=
 =?us-ascii?q?EEjchE1ycBO+WiTXPBEfjxciYhF95DXlI2t1uyMExSBdqsLwaK+i764jEdAA?=
 =?us-ascii?q?jwOhRoLerpBIHSk9631+ev8JHPfglEnjWwba58IRmsswnct80bjYRhJ6ov1x?=
 =?us-ascii?q?DEvmZGd+NKyG1yOFmdhQz85sC+/J5i9yRfpfcs/NNeXKv5Yqo1U6VWACwpPG?=
 =?us-ascii?q?4p6sLrswLDTRaU6XsHTmoWiBtIDBPb4xz8Q5z8rzH1tut52CmdIM32UbU5Ui?=
 =?us-ascii?q?ms4qt3VBPljjoMOzg+/G/KlsN/lqdboRK4qxFhxI7UepmVNP1kfqzHYdMVW3?=
 =?us-ascii?q?NNUdhXVyBYHo68c5cPAPAdMuZYsYb9okUBrR2iBQW1GuzvzCZEiHjx3a08ze?=
 =?us-ascii?q?sgERjK0xImH9kTtHjZosn5OLsXXe2z0aLGzyjMb+lO1Dnz6IbIaA4vr/KRU7?=
 =?us-ascii?q?1/bcXfxlIiFx/Hg1qMtYDpIy+Z2voLvmOG7+RgT+Wvi2s/pg9rvDev2tkjip?=
 =?us-ascii?q?PUjY0VzVDE8yp5y5syKN2gVkF7fcCrEIFetiGdMYt2TdgvQ2FzuCkh1rIKo4?=
 =?us-ascii?q?K0fC8PyJg9xx7faOWKfo6V6RzgTOacOSl0iG9ndb6lmhq//1SsxvfiWsS7yl?=
 =?us-ascii?q?pHoCpIn9/RvX4XzRPT8NKISv5l80ek3jaAyh7c5/lfIUAxiarbM5khwqMslp?=
 =?us-ascii?q?YLsUTMACv2mELuga+TbEok++yo6/75bbXiupOROJV4ih/5MqszgMO/D+M4Mg?=
 =?us-ascii?q?4QUGSB5+u8z6Xv/Uz/QLpUkv07irfVvI3YKMgBu6K0DRNZ3pw95xuwFTur3t?=
 =?us-ascii?q?QVkWECLF1feRKHi4bpO0vJIPD9Ffq/m0qjkCt1yPDcMLzhBZPNLnfYnbfhZr?=
 =?us-ascii?q?Zy8FJTxBAvwtBY4pJYELEBIPHrVk/rqNPYFgM5MxCzw+v/DNV914UeWX+AA6?=
 =?us-ascii?q?OAKqPdr1mI6fw0I+aWf48ZoS39K/856PP1k385lkESfbOz0ZsUdn+4BPJmLF?=
 =?us-ascii?q?udYXb2hdcBC2gK7UICS7nuiVufQXtJanC/RKsnoyo8A6q4AorZAIOgmrqM2G?=
 =?us-ascii?q?G8BJIFXG1eDkGwFiLQepmJQb8zbySdapt5nyAJT6emTYAh1hG1vgTSxL9uL+?=
 =?us-ascii?q?6S8Sod48HNzt9wstXeiRwovQNzCcvVh3mAU2xugWQOSBc2x6p050d6zxGD0v?=
 =?us-ascii?q?4r0LRjCdVP6qYQAU8BPpnGwrkhU4j/?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2ETKgAg/RtemCMYgtkUBjMYGgEBAQE?=
 =?us-ascii?q?BAQEBAQMBAQEBEQEBAQICAQEBAYF7AgEBFwEBgS6BTVIgEpNQgU0fg0OLY4E?=
 =?us-ascii?q?Agx4VhggTDIFbDQEBAQEBNQIBAYRATgEXgQ8kOgQNAgMNAQEFAQEBAQEFBAE?=
 =?us-ascii?q?BAhABAQEBAQYNCwYphUqCHQweAQQBAQEBAwMDAQEMAYNdBxkPOUpMAQ4BU4M?=
 =?us-ascii?q?EgksBATOFJJdMAY0EDQ0ChR2CPwQKgQmBGiOBNgGMGBqBQT+BIyGCKwgBggG?=
 =?us-ascii?q?CfwESAWyCSIJZBI1CEiGBB4gpmBeCQQR2iUyMAoI3AQ+IAYQxAxCCRQ+BCYg?=
 =?us-ascii?q?DhE6BfaM3V4EMDXpxMxqCJhqBIE8YDYgbji1AgRYQAk+JLoIyAQE?=
X-IPAS-Result: =?us-ascii?q?A2ETKgAg/RtemCMYgtkUBjMYGgEBAQEBAQEBAQMBAQEBE?=
 =?us-ascii?q?QEBAQICAQEBAYF7AgEBFwEBgS6BTVIgEpNQgU0fg0OLY4EAgx4VhggTDIFbD?=
 =?us-ascii?q?QEBAQEBNQIBAYRATgEXgQ8kOgQNAgMNAQEFAQEBAQEFBAEBAhABAQEBAQYNC?=
 =?us-ascii?q?wYphUqCHQweAQQBAQEBAwMDAQEMAYNdBxkPOUpMAQ4BU4MEgksBATOFJJdMA?=
 =?us-ascii?q?Y0EDQ0ChR2CPwQKgQmBGiOBNgGMGBqBQT+BIyGCKwgBggGCfwESAWyCSIJZB?=
 =?us-ascii?q?I1CEiGBB4gpmBeCQQR2iUyMAoI3AQ+IAYQxAxCCRQ+BCYgDhE6BfaM3V4EMD?=
 =?us-ascii?q?XpxMxqCJhqBIE8YDYgbji1AgRYQAk+JLoIyAQE?=
X-IronPort-AV: E=Sophos;i="5.69,427,1571695200"; 
   d="scan'208";a="304562334"
Received: from mailrel04.vodafone.es ([217.130.24.35])
  by mail01.vodafone.es with ESMTP; 13 Jan 2020 06:20:34 +0100
Received: (qmail 24517 invoked from network); 12 Jan 2020 05:00:21 -0000
Received: from unknown (HELO 192.168.1.3) (quesosbelda@[217.217.179.17])
          (envelope-sender <peterwong@hsbc.com.hk>)
          by mailrel04.vodafone.es (qmail-ldap-1.03) with SMTP
          for <linux-renesas-soc@vger.kernel.org>; 12 Jan 2020 05:00:21 -0000
Date:   Sun, 12 Jan 2020 06:00:20 +0100 (CET)
From:   Peter Wong <peterwong@hsbc.com.hk>
Reply-To: Peter Wong <peterwonghkhsbc@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Message-ID: <30883411.460824.1578805221782.JavaMail.cash@217.130.24.55>
Subject: Investment opportunity
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Greetings,
Please read the attached investment proposal and reply for more details.
Are you interested in loan?
Sincerely: Peter Wong




----------------------------------------------------
This email was sent by the shareware version of Postman Professional.

