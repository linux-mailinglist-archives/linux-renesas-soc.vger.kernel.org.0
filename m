Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5F0113846F
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 Jan 2020 02:43:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731891AbgALBn6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 11 Jan 2020 20:43:58 -0500
Received: from mail3-bck.iservicesmail.com ([217.130.24.85]:40298 "EHLO
        mail3-bck.iservicesmail.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731889AbgALBn5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 11 Jan 2020 20:43:57 -0500
X-Greylist: delayed 303 seconds by postgrey-1.27 at vger.kernel.org; Sat, 11 Jan 2020 20:43:56 EST
IronPort-SDR: eMXnfPkoNrF30waoZX7PaaBYyinYe2R2/0Q9g1bYDNOT/Ex3oAAQFgHHfFeMJRzVcXGWQOTKlA
 gwnjWjYqoBmA==
IronPort-PHdr: =?us-ascii?q?9a23=3AXsolJRBtudTq5j75s4GdUyQJP3N1i/DPJgcQr6?=
 =?us-ascii?q?AfoPdwSPX6psbcNUDSrc9gkEXOFd2Cra4d0KyM7f6rAjJIyK3CmUhKSIZLWR?=
 =?us-ascii?q?4BhJdetC0bK+nBN3fGKuX3ZTcxBsVIWQwt1Xi6NU9IBJS2PAWK8TW94jEIBx?=
 =?us-ascii?q?rwKxd+KPjrFY7OlcS30P2594HObwlSizexfL1/IA+ooQjQt8QajoVvJ6cswR?=
 =?us-ascii?q?bVv3VEfPhby3l1LlyJhRb84cmw/J9n8ytOvv8q6tBNX6bncakmVLJUFDspPX?=
 =?us-ascii?q?w7683trhnDUBCA5mAAXWUMkxpHGBbK4RfnVZrsqCT6t+592C6HPc3qSL0/RD?=
 =?us-ascii?q?qv47t3RBLulSwLMTk1/nzLhcNqiaJaoAutqgJ4w47OeIGVM+B+cbnBfdwEXG?=
 =?us-ascii?q?ZOQMBRWzVdD4Ogc4sAFfYOPeZGoIn4uVQOqwe+CRCyC+Pp0zNGgXj23ask3O?=
 =?us-ascii?q?UhCA3JwgogFM8KvHnasNn5KKIeXOaox6fK0DrDdetb1zn95ojSbB4vouyCUr?=
 =?us-ascii?q?1sfsTe0kQvCwHIgUmMpYD5Iz+ZyOIAuHWb4ep6UuKvjnYqpRtvrTiz2MgskJ?=
 =?us-ascii?q?TCiYISylDC+iVy3YE4JcWmR05nf9GkCpVRtyacN4t5Wc4iQ3potz0mxbEcpZ?=
 =?us-ascii?q?G7ey0KxI4nxx7ccvGKdZWD7BH7VOuJPzt0mXBodKiiixu87USs0PPwW8au3F?=
 =?us-ascii?q?tEridIlMTHuGoX2BzJ8MeHT+Nw/kKm2TmSyQ/e8vpEIUUolarDLJ4h36Iwmo?=
 =?us-ascii?q?ITsUvdGi/2n137jKqMeUUl/uio8froYrH6qpKTLYN0lAb+Pbk0lcyxBuQ4NB?=
 =?us-ascii?q?YBU3KF9uSnzLHj/Ev5T6tWjvAujKXVrZLXKd4GqqO3HwNZyJgv5hmlAzqo0N?=
 =?us-ascii?q?kUhXwHI0hEeBKDgYjpIVbOIPXgAPennVusjClkx+rIP73mBJXNIWPOkLf6fb?=
 =?us-ascii?q?lm90FQ0hY8zdda555OCrEBI+r/WlXtu9zAEh85Lwu0zv7jCNV80IMeRG2ODr?=
 =?us-ascii?q?aDMKzMt1+H+PkvLPOXZIMMozb9LOQq6uXwjX82h1AdZ7Ol3ZgJZ3CiGPRpPU?=
 =?us-ascii?q?GZbWDrgtcbHmdZ9jY5GejrjkCSFCReYXupVrl5/TYwIJypAJ2FRY23hrGFmi?=
 =?us-ascii?q?ChEc5sa3hCG2yLRE/la4ieE8gLbi3adtdsjjEeSr+nRI863xqutyf1zrNmKq?=
 =?us-ascii?q?zf/ShO5rz5090g3+DPmAt6yjtyAIzJy2yRQntrmWUHbz8t1qs5qkt4jFeAh/?=
 =?us-ascii?q?sry8dEHMBesqoaGjwxMoTRmrciU90=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2HVAQC5dxpelyMYgtlMGBoBAQEBAQE?=
 =?us-ascii?q?BAQEDAQEBAREBAQECAgEBAQGBaAQBAQEBCwEBGwQBgSmBTVIgEpNQgU0fg0O?=
 =?us-ascii?q?LY4EAgx4VhgcUDIFbDQEBAQEBNQIBAYRATgEXgQ8kNQgOAgMNAQEFAQEBAQE?=
 =?us-ascii?q?FBAEBAhABAQEBAQYYBoVzgh0MHgEEAQEBAQMDAwEBDAGDXQcZDzlKTAEOAVO?=
 =?us-ascii?q?DBIJLAQEznX0BjQQNDQKFHYI7BAqBCYEaI4E2AYwYGoFBP4EjIYIrCAGCAYJ?=
 =?us-ascii?q?/ARIBbIJIglkEjUISIYEHiCmYF4JBBHaJTIwCgjcBD4gBhDEDEIJFD4EJiAO?=
 =?us-ascii?q?EToF9ozdXdAGBHnEzGoImGoEgTxgNiBuOLUCBFhACT4xbgjIBAQ?=
X-IPAS-Result: =?us-ascii?q?A2HVAQC5dxpelyMYgtlMGBoBAQEBAQEBAQEDAQEBAREBA?=
 =?us-ascii?q?QECAgEBAQGBaAQBAQEBCwEBGwQBgSmBTVIgEpNQgU0fg0OLY4EAgx4VhgcUD?=
 =?us-ascii?q?IFbDQEBAQEBNQIBAYRATgEXgQ8kNQgOAgMNAQEFAQEBAQEFBAEBAhABAQEBA?=
 =?us-ascii?q?QYYBoVzgh0MHgEEAQEBAQMDAwEBDAGDXQcZDzlKTAEOAVODBIJLAQEznX0Bj?=
 =?us-ascii?q?QQNDQKFHYI7BAqBCYEaI4E2AYwYGoFBP4EjIYIrCAGCAYJ/ARIBbIJIglkEj?=
 =?us-ascii?q?UISIYEHiCmYF4JBBHaJTIwCgjcBD4gBhDEDEIJFD4EJiAOEToF9ozdXdAGBH?=
 =?us-ascii?q?nEzGoImGoEgTxgNiBuOLUCBFhACT4xbgjIBAQ?=
X-IronPort-AV: E=Sophos;i="5.69,423,1571695200"; 
   d="scan'208";a="323105126"
Received: from mailrel04.vodafone.es ([217.130.24.35])
  by mail02.vodafone.es with ESMTP; 12 Jan 2020 02:38:52 +0100
Received: (qmail 8417 invoked from network); 11 Jan 2020 23:46:31 -0000
Received: from unknown (HELO 192.168.1.3) (quesosbelda@[217.217.179.17])
          (envelope-sender <peterwong@hsbc.com.hk>)
          by mailrel04.vodafone.es (qmail-ldap-1.03) with SMTP
          for <linux-renesas-soc@vger.kernel.org>; 11 Jan 2020 23:46:31 -0000
Date:   Sun, 12 Jan 2020 00:46:30 +0100 (CET)
From:   Peter Wong <peterwong@hsbc.com.hk>
Reply-To: Peter Wong <peterwonghsbchk@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Message-ID: <10027825.172063.1578786391682.JavaMail.cash@217.130.24.55>
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

